class EventSeries < ActiveRecord::Base
	  attr_accessor :title, :description, :commit_button
    belongs_to :user
    has_many :events, :dependent => :destroy

    validates :frequency, :period, :starttime, :endtime,  :presence => true
    after_create :create_events_until_end_time

    def create_events_until_end_time(end_time=RECURRING_EVENTS_UPTO)
      puts
      puts "3.次のメソッドの中だよcreate_events_unitl_and_time"
      puts 
      puts old_start_time   = starttime
      puts old_end_time     = endtime
      puts frequency_period = recurring_period(period)
      puts period
      puts 
      new_start_time, new_end_time = old_start_time, old_end_time

      while frequency.send(frequency_period).from_now(old_start_time) <= end_time
        puts
        puts "新規イベントを追加する #{frequency_period}"
        self.events.create( 
                            :title => title, 
                            :description => description, 
                            :all_day => all_day, 
                            :starttime => new_start_time, 
                            :endtime => new_end_time,
                            :user_id => self.user_id
                          )

        new_start_time = old_start_time = frequency.send(frequency_period).from_now(old_start_time)
        new_end_time   = old_end_time   = frequency.send(frequency_period).from_now(old_end_time)
        puts 
        puts "新しいnew_start_time: #{new_start_time}"
        puts "新しいnew_end_time: #{new_end_time}"

        if period == '毎月' or period == '毎年'
          begin 
            puts "period == '毎月' が成功したよ！"
            new_start_time = make_date_time(starttime, old_start_time)
            new_end_time   = make_date_time(endtime, old_end_time)
          rescue
            new_start_time = new_end_time = nil
          end
        end
      end
    end

    def recurring_period(period)
      Event::REPEATS.key(period.titleize).to_s.downcase
    end

    private 

      def make_date_time(original_time, difference_time)
        DateTime.parse("#{original_time.hour}:#{original_time.min}:#{original_time.sec}, #{original_time.day}-#{difference_time.month}-#{difference_time.year}")
      end
end

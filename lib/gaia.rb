require 'rubysdk'

class Main
    def self.main
        job1 = RubySDK::Interface::Job.new(title: "job1", handler: lambda { |args| puts "Job1 has been started" })
        job2 = RubySDK::Interface::Job.new(title: "job2", handler: lambda { |args| puts "Job2 has been started" })
        begin
            RubySDK::Serve([job1, job2])
        rescue => e
            puts "Error occured: #{e}"
        end
    end
end


require 'rubysdk'

class Main
    AwesomeJob = lambda do |args|
        STDERR.puts "This output will be streamed back to gaia and will be displayed in the pipeline logs."

        # An error occurred? Raise an exception and gaia will fail the pipeline.
        # raise "Oh gosh! Something went wrong!"
    end

    def self.main
        awesomejob = Interface::Job.new(title: "Awesome Job",
                                        handler: AwesomeJob,
                                        desc: "This job does something awesome.")

        begin
            RubySDK.Serve([awesomejob])
        rescue => e
            puts "Error occured: #{e}"
            exit(false)
        end
    end
end

require 'rubysdk'

class Main
    Job1_handler = lambda do |args|
        args.each do |arg|
            STDERR.puts "Key: #{arg.key}; Value: #{arg.value}"
        end
    end
    Job2_handler = lambda do |args|
        STDERR.puts "Job2 has been executed!"
    end
    Job3_handler = lambda do |args|
        STDERR.puts "Job3 has been executed!"
    end

    def self.main
        args = []
        args.push Interface::Argument.new(desc: "Schema name for new database:",
                                          type: Interface::TextFieldInput,
                                          key: "username")
        args.push Interface::Argument.new(type: Interface::VaultInput,
                                          key: "dbpassword")
        job1 = Interface::Job.new(title: "job1", 
                                  handler: Job1_handler,
                                  args: args)
        job2 = Interface::Job.new(title: "job2", 
                                  handler: Job2_handler,
                                  dependson: ["job1"])
        job3 = Interface::Job.new(title: "job3",
                                  handler: Job3_handler,
                                  dependson: ["job2"])
        begin
            RubySDK.Serve([job1, job2, job3])
        rescue => e
            puts "Error occured: #{e}"
        end
    end
end


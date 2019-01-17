require 'rubysdk'

class Main

    PrintParam = lambda do |args|
        args.each do |arg|
            STDERR.puts "Key: #{arg.key}; Value: #{arg.value}"
        end
    end

    def self.main
        args = []
        args.push Interface::Argument.new(key: "dbpassword",
                                          # VaultInput automatically gets a secret from Gaia's vault.
                                          # You can also use "TextAreaInput", "BooleanInput",
                                          # or "VaultInput".
                                          type: Interface::VaultInput)
        printparam = Interface::Job.new(title: "Print Parameters",
                                        handler: PrintParam,
                                        desc: "This job prints out all given params.",
                                        args: args)

        begin
            RubySDK.Serve([printparam])
        rescue => e
            puts "Error occured: #{e}"
            exit(false)
        end
    end
end


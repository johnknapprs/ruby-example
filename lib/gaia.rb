require 'rubysdk'

class Main

    PrintParam = lambda do |args|
        args.each do |arg|
            STDERR.puts "Key: #{arg.key}; Value: #{arg.value}"
        end
    end

    def self.main
        args = []
        args.push Interface::Argument.new(desc: "Username for the database schema:",
                                          # textfield displays a text field in the UI.
                                          # You can also use "TextAreaInput", "BooleanInput",
                                          # or "VaultInput".
                                          type: Interface::TextFieldInput,
                                          key: "username")
        args.push Interface::Argument.new(type: Interface::TextAreaInput,
                                          key: "usernamedesc")
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


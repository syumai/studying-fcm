JSON.module_eval do
  alias :orig_parse :parse
  def parse(source, opts = {symbolize_names: true})
    orig_parse(source, opts)
  end
  module_function :orig_parse, :parse
end


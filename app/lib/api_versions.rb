class ApiVersion
  attr_reader :version, :default

  def initialize(version, default = false)
    @version = version
    @default = default
  end

  def matches?(request)
    check_headers(headers)
  end

    private

    def check_headers
      accept = headers[:accept]
      accept && accept.include?("application/vnd.todos.#{version}+json")
    end
end

module IssueCentre
  class GenericConnection < Savon::Client

    # Never used directly. Use sub-classes instead.
    # @see AuthConnection
    # @see CustomerConnection
    #
    # @param [String] endpoint_url IssueCentre endpoint url
    #   (e.g. {https://support.callclosed.net/issuecentre/Connection})
    # @param [String] username A valid IssueCentre username
    # @param [String] password A valid IssueCentre password
    # @param [Hash] options Other options to pass to the constructors
    #
    # @return [Connection] instance of Connection
    #
    def initialize( base_url, options = {})

      @log = options[:log] || false
      @log_level = options[:log_level] || :info
      @wsdl_suffix = options[:wsdl_suffix] || "?wsdl"
      @endpoint_url = options[:endpoint] || base_url
      @issue_centre_url = base_url + @wsdl_suffix

      super( wsdl: @issue_centre_url,
             endpoint: @endpoint_url,
             log_level: @log_level,
             log: @log
           )
    end

  end
end

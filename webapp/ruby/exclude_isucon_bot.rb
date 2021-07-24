module ExcludeIsuconBot
  BOT_REGEXP = [
    /ISUCONbot(-Mobile)?/,
    /ISUCONbot-Image\//,
    /Mediapartners-ISUCON/,
    /ISUCONCoffee/,
    /ISUCONFeedSeeker(Beta)?/,
    /crawler \(https:\/\/isucon\.invalid\/(support\/faq\/|help\/jp\/)/,
    /isubot/,
    /Isupider/,
    /Isupider(-image)?\+/,
    /(bot|crawler|spider)(?:[-_ .\/;@()]|$)/i,
  ]

  before do
    BOT_REGEXP.each do |regexp|
      if regexp.match?(request.user_agent)
        halt 503
      end
    end
  end
end

class Banner
  def initialize(message, banner_length=message.length)
    @message = message
    @banner_length = banner_length
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-'*@banner_length}-+"
    # '+' + ('-'*(@banner_length + 2)) + '+'
    # p 48 - message.size
  end

  def empty_line
    '|' + (' '*(@banner_length + 2)) + '|'
  end

  def message_line
    "| #{' '*((@banner_length-@message.length)/2.to_f).ceil}#{@message}#{' '*((@banner_length-@message.length)/2)} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

banner = Banner.new('--', 78)
puts banner

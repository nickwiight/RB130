class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen(&block)
    return unless block_given?

    recording = block.call
    record(recording) if recording.instance_of?(String) && recording != ''
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen { "" }
listener.listen { 6 }
listener.listen { }
listener.listen
listener.play # Outputs "Hello World!"

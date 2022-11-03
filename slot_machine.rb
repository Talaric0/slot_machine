class SlotMachine

  SYMBOLS = %w[cherry seven bell star joker].freeze

  def initialize(reels = [])
    @reels = reels
  end

  def play
    @reels = []
    3.times do
      @reels << SYMBOLS.sample
    end
    @reels
  end

  def score
    if three_identical?
      return base_score(@reels[0]) * 10
    elsif two_identical_and_joker?
      return base_score(@reels.sort[1]) * 5
    else
      return 0
    end
  end

  private

  def three_identical?
    @reels.uniq.length == 1
  end

  def two_identical_and_joker?
    @reels.uniq.length == 2 && @reels.include?('joker')
  end

  def base_score(element)
    SYMBOLS.index(element) + 1
  end
end

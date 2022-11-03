require_relative '../slot_machine.rb'


def test_scenario(reels, expected_score)
  it "return #{expected_score} for #{reels[0]}/#{reels[1]}/#{reels[2]}" do
    slot_machine = SlotMachine.new(reels)
    score = slot_machine.score

    expect(score).to eq(expected_score)
  end
end


describe SlotMachine do
  describe '#score' do
    # test scenario for 3x the same symbol
    test_scenario(%w[joker joker joker], 50)
    test_scenario(%w[star star star], 40)
    test_scenario(%w[bell bell bell], 30)
    test_scenario(%w[seven seven seven], 20)
    test_scenario(%w[cherry cherry cherry], 10)

		# test scenarios for 2x jokers + anything
		test_scenario(%w[joker joker star], 25)
    test_scenario(%w[joker joker bell], 25)
    test_scenario(%w[joker joker seven], 25)
    test_scenario(%w[joker joker cherry], 25)

		# test scenarios for 2x anything + 1x joker
    test_scenario(%w[star star joker], 20)
    test_scenario(%w[bell bell joker], 15)
    test_scenario(%w[seven seven joker], 10)
    test_scenario(%w[cherry cherry joker], 5)

		# test scenarios for 2x anything + anything (no joker)
    test_scenario(%w[star star bell], 0)
    test_scenario(%w[star star seven], 0)
    test_scenario(%w[star star cherry], 0)
    test_scenario(%w[bell bell star], 0)
    test_scenario(%w[bell bell seven], 0)
    test_scenario(%w[bell bell cherry], 0)
    test_scenario(%w[seven seven star], 0)
    test_scenario(%w[seven seven bell], 0)
    test_scenario(%w[seven seven cherry], 0)
    test_scenario(%w[cherry cherry star], 0)
    test_scenario(%w[cherry cherry bell], 0)
    test_scenario(%w[cherry cherry seven], 0)
  end
end

require 'rspec'
require './lib/gate'
require './lib/ticket'

RSpec.describe 'Gate' do
  let(:umeda)  { Gate.new(:umeda) }
  let(:juso)   { Gate.new(:juso) }
  let(:mikuni) { Gate.new(:mikuni) }

  it 'returns true when umeda_to_juso' do
    ticket = Ticket.new(150)
    umeda.enter(ticket)
    expect(juso.exit(ticket)).to be_truthy
  end

  context 'when umeda_to_mikuni' do
    it 'returns false when fare is not enough' do
      ticket = Ticket.new(150)
      umeda.enter(ticket)
      expect(mikuni.exit(ticket)).not_to be_truthy
    end

    it 'returns true when fare is enough' do
      ticket = Ticket.new(190)
      umeda.enter(ticket)
      expect(mikuni.exit(ticket)).to be_truthy
    end
  end

  it 'returns true when juso to mikuni' do
    ticket = Ticket.new(150)
    juso.enter(ticket)
    expect(mikuni.exit(ticket)).to be_truthy
  end
end

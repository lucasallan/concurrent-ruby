require 'concurrent/actor/drb_adapter'
class ForBar
  def tell() :tell end
end

describe Concurrent::Actor::DrbAdapter do
  let!(:server) { Concurrent::Actor::DrbAdapter.new({object: ForBar.new}).start }
  subject { DRbObject.new_with_uri(server.uri) }

  it 'call the remote object' do
    expect(subject.tell).to eq(:tell)
  end
end

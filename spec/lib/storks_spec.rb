require 'storks'
require 'tempfile'
describe Storks do
  describe '::seed!' do
    subject { described_class.seed! name }

    context 'with "demo" name' do
      let(:name) { 'demo' }

      before do
        expect(Storks::SeedType).to receive(:new).with('demo').and_return(fake_seed_type)
      end

      let(:ruby_file_path) do
        t = Tempfile.new('loadable_ruby')
        t.write('class CrazyCode; end')
        t.close
        t.path
      end

      let(:fake_seed_type) { double(Storks::SeedType, seed_rb: ruby_file_path) }

      it 'loads a seed type' do
        subject

        # expect(Kernel).to receive(:load).with(ruby_file_path)
        # above does not seem to work.. using CrazyCode hack instead for now.

        expect(CrazyCode).to be_an Class
      end
    end
  end
end

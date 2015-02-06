require 'storks/seed_type'
describe Storks::SeedType do

  describe '::base_dir' do
    subject(:dir) { described_class.base_dir }

    context 'by default' do
      specify { expect(dir).to eq File.expand_path('../../../../', __FILE__) }
    end

    context 'with an ENV value' do
      before do
        ENV['STORKS_BASE_DIR'] = test_dir
      end
      let(:test_dir) { File.expand_path('../../../test_dir', __FILE__) }

      specify { expect(dir).to eq test_dir }
    end

    context 'when in Rails' do
      before do
        stub_const('Rails', double('FakeRails', root: '/a/b/c'))
      end
      specify { expect(dir).to eq '/a/b/c' }
    end
  end

  describe '::seed_base_dir' do
    subject(:path) { described_class.seeds_base_path }

    it 'provides a Pathname' do
      expect(path).to be_an Pathname
    end

    it 'gives a default path' do
      expect(path.to_s).to end_with 'db/seed_flavours'
    end
  end

  describe '::new' do
    subject { object }

    let(:object) { described_class.new name }

    context 'with a nil name' do
      let(:name) { nil }

      it 'must be passed a non-empty string' do
        expect { subject }.to raise_exception ArgumentError
      end
    end

    context 'with a blank name' do
      let(:name) { '' }

      it 'must be passed a non-empty string' do
        expect { subject }.to raise_exception ArgumentError
      end
    end

    context 'with "nonexisting" name' do
      let(:name) { 'nonexisting' }

      it 'builds a seed type' do
        expect { subject }.to raise_exception ArgumentError
      end
    end
  end

end

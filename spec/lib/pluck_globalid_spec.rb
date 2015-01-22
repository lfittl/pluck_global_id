require 'spec_helper'

RSpec.describe PluckGlobalID do
  it 'returns GlobalID records' do
    sample = Sample.create! name: 'Something'

    gid_record = Sample.pluck_global_id.first
    expect(gid_record).to be_present
    expect(gid_record).to be_a(PluckGlobalID::Record)
    expect(gid_record.to_global_id).to eq sample.to_global_id
  end

  it 'respects where clauses on the scope' do
    s1 = Sample.create! name: 'sample 1'
    s2 = Sample.create! name: 'sample 2'
    expect(Sample.where(name: 'sample 1').pluck_global_id.map(&:to_global_id)).to eq [s1.to_global_id]
  end

  it 'works with limit' do
    10.times { Sample.create! name: 'Something' }
    expect(Sample.limit(1).pluck_global_id.size).to eq 1
  end

  it 'works with empty scopes' do
    expect(Sample.pluck_global_id).to eq []
  end
end

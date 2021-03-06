# frozen_string_literal: true

require 'rails_helper'

describe TopicParticipantsSummary do
  describe '#summary' do
    let(:summary) { described_class.new(topic, user: topic_creator).summary }

    let(:topic) do
      Fabricate(:topic,
        user: topic_creator,
        archetype: Archetype::private_message,
        category_id: nil
      )
    end

    let(:topic_creator) { Fabricate(:user) }
    let(:user1) { Fabricate(:user) }
    let(:user2) { Fabricate(:user) }
    let(:user3) { Fabricate(:user) }
    let(:user4) { Fabricate(:user) }
    let(:user5) { Fabricate(:user) }

    it "must never contains the user and at most 4 participants" do
      topic.allowed_user_ids = [user1.id, user2.id, user3.id, user4.id, user5.id]
      expect(summary.map(&:user)).to eq([user1, user2, user3, user4])
    end

  end
end

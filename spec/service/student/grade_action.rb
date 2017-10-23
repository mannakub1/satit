require 'rails_helper'
require 'guard_message'

pathname = Pathname.new(__FILE__)
RSpec.describe "[Service: #{pathname.dirname.basename}/#{pathname.basename}]\n\n Teacher::SubjectAction" do

  before(:context) do
    @group_admin = FactoryGirl.create(:member)
    @member_1 = FactoryGirl.create(:member, fullname: 'Member One')
  end

  context '#approve: A need-approve-group admin approves a join request.' do
    before(:context) do
      @need_approve_group = Member::GroupAction.new(@group_admin).create(FactoryGirl.attributes_for(:group_that_need_approve))
      @member_1_group_action = Member::GroupAction.new(@member_1, @need_approve_group)
      @group_admin_action_on_one = Member::GroupAdminAction.new(@group_admin, @need_approve_group, @member_1)
    end

    it '- A group admin approve a join request.' do
      @member_1_group_action.join
      expect { @group_admin_action_on_one.approve }.not_to raise_error
      expect(Group::MemberList.new(@need_approve_group).members.map(&:id)).to include @member_1.id
    end
  end
end
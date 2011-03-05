require 'spec_helper'

describe 'Security' do

  context 'Facility access requests' do
    before do
      @current_time = 'late'
      SecurityLogger.should_receive(:log_event)
    end
    
    context 'for a user with access' do
      before do
        @user = User.new(:access => true)
      end

      it 'should grant user access level' do  
        @user.should have_access
      end
    end
    
    context 'for a user without access' do
      before do
        @user = User.new(:access => false)
      end
      it 'should not grant acess' do
        @user.should_not have_access
      end
    end
    
    
  end

  context 'Elevator Access' do
    
    context 'when it is late' do

      before do
        @current_time = 'not business hours'
        @user_with_permission = User.new(:permission => true)
        @user_without_permission = User.new(:permission => false)
      end

      it 'should validate access level to user with permission'do
        validated = Security::Elevator.validate(@user_with_permission, @current_time)
        validated.should == true
      end

      it 'should not validate access level'do
        validated = Security::Elevator.validate(@user_without_permission, @current_time)
        validated.should == false
      end
    end
    
    context 'when it\'s not late' do

      before do
        @current_time = 'business hours'
        @user_with_permission = User.new(:permission => true)
        @user_without_permission = User.new(:permission => false)
      end

      it 'should grant full elevator access' do
       validated = Security::Elevator.validate(@user_without_permission,@current_time)
        validated.should == true
       validated =Security::Elevator.validate(@user_with_permission,@current_time)  
       
        validated.should == true       
      end
    end
  end

  context 'Office Access' do
    before do
    end
    it 'should validate employee acess'
  end
  
  context 'Lockdown Mode' do
    before do
      Security::Elevator.locked = true
    end
    
    it 'Should Secure all Elevators' do
      Security::Elevator.locked.should == true
    end
  end

end
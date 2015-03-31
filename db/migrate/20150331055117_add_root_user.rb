class AddRootUser < ActiveRecord::Migration
  def self.up


user = User.create!(:id=>1,:email=>"samiksha@ptiwebtech.com",:password => 'whoiam13',:first_name=>'Samiksha',:last_name=>'Galav',:admin=>1)


  end

  def self.down
    user = User.find_by_email( 'samiksha@ptiwebtech.com' )
    user.destroy
 
  end
end

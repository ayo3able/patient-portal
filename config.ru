require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'

end

# In order to sen Patch and Delete request.
use Rack::MethodOverride

run ApplicationController
use AppointmentsController
use PatientsController
use PhysiciansController

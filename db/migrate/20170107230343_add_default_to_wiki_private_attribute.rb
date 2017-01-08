class AddDefaultToWikiPrivateAttribute < ActiveRecord::Migration[5.0]

	def up
	  change_column_default :wikis, :private, false
	end

	def down
	  change_column_default :wikis, :private, nil
	end

end

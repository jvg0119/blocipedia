module WikisHelper

	def private_wiki_allowed(wiki)
		(!@wiki.id && current_user.premium? || current_user.admin?) || 
		(@wiki.id && current_user.premium? && @wiki.user == current_user)
	end
end


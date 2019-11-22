module TeamsHelper
    def get_team_members
        members = User.where(team_id: Team.find(params[:id]).id)
        if members == nil 
            return []
        else
            return members
        end
    end
end

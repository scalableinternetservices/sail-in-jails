module SplashScreenHelper

    def get_team_course_name(team)
        course_name = Course.where(id: team.course)
        if course_name.length > 0
          return course_name[0].name
        else
          return "This team does not have a course!"
        end 
      end

end

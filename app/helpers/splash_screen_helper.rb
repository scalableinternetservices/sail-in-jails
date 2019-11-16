module SplashScreenHelper

    def get_team_course_name(team)
        course_name = Course.find(team.course)
        if course_name
          return course_name.name
        else
          return "This team does not have a course!"
        end 
      end

end

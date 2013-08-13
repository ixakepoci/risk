t = ["Risk","Ambiguity","Time"]
survey_legend = 
    ["This test will measure your attitude towards risk. 
      You will be asked  20 times to choose to invest between two gambles with two possible outcomes.  
      Your final results will depend on your answers so it is very important that you answer these questions seriously 
      if you want to be sent an exact analysis of your profile at the end of the experiment.", 
      "This test will measure your attitude towards ambiguity. 
      You will be asked  20 times to choose to invest between two gambles with several possible outcomes.
      Your final results will depend on your answers so it is very important that you answer these questions seriously 
      if you want to be sent an exact analysis of your profile at the end of the experiment.",
      "This test will measure your attitude towards time uncertainty. 
      You will be asked 20 times to choose to invest between two options involving receiving money now or in the future.
      Your final results will depend on your answers so it is very important that you answer these questions seriously 
      if you want to be sent an exact analysis of your profile at the end of the experiment."]


survey "Riskanner survey", :default_mandatory => false do
  section "Start screen" do
    label "These tests will assess your  attitudes towards three kinds of uncertainty: risk, time and ambiguity. 
    You will be asked to answer a series of investment questions. At the end of the three tests, 
    you will be sent a detailed compared analysis of your results. The test will last about 15 minutes. 
    You have to take the three tests to get your results."
  end

  section "Start questions" do

    label "Some questions to start with..."
    question "Age" 
    answer :integer
    question "Gender", :pick => :one
    answer "Male"
    answer "Female"
    question "Job"
    answer :string
    question "Sector"
    answer :string
    question "Position"
    answer :string
    question "Years of work experience with this job"
    answer :integer
    question "About how much money did you deal with in your job last year?"
    answer :string
  end

  section "Notice" do 
    label "All  the amounts of money in the following questions are in 10000 of euros"
  end
  for k in (0...3) do
    current_test = t.delete_at(rand(t.size))
    section "Legend" do 
      if current_test == "Risk" 
        label survey_legend[0]
      elsif current_test == "Ambiguity" 
        label survey_legend[1]
      else label survey_legend[2]
      end
    end
    for i in (0...20) do
      section "#{current_test} questions" do
        # A label is a question that accepts no answers
        if current_test == "Risk" 
          label "1", :custom_renderer => "/partials/risk"
        elsif current_test == "Ambiguity" 
          label "1", :custom_renderer => "/partials/ambiguity"
        else label "1", :custom_renderer => "/partials/time"
        end
        
        label "Please consider the two gambles below, which of these two gambles would you rather play?"
        # A basic question with radio buttons
        question "Please select one answer.", :pick => :one
        answer "Case 1"
        answer "Case 2"

      end
    end
  end
  section "Get email" do
    label "Thank you for participating in the test!"
    question "Let your email address if you want to get an detailed analysis of your results"
    answer :string
  end
end

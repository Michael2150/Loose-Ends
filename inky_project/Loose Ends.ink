# theme: dark
# author: Michael Gerber, Sean Mackey, Dominika Kmiecik

//======================================= CONSTANT VALUES ==============================================
CONST OUTSIDE_FRONT = 1
CONST OUTSIDE_LEFT= 2
CONST OUTSIDE_BACK = 3
CONST OUTSIDE_RIGHT = 4
CONST INSIDE_BATHROOM = 5
CONST INSIDE_OFFICE = 6
CONST INSIDE_FRONT = 7
CONST INSIDE_CELLS = 8
CONST INSIDE_BACKOFFICE  = 9
CONST INSIDE_EVIDENCE_ROOM = 10

//======================================= VARIABLES ==============================================

VAR debug = false //ENABLES DEBUGGING, THIS STARTS THE STORY WHERE I'M CURRENTLY WORKING ON IT INSTEAD OF THE BEGINNING.
VAR is_possessing_a_rat = false //Stores whether you are possessing the rat.
VAR is_possessing_the_secretary = false //Stores whether you are possessing the secretary.
VAR has_learned_to_unpossess_rat = false //This indicates that the player has learned the ability to unpossess things.
VAR where_does_rat_spawn = -1 //Indicates the place where the rat spawns.
VAR rat_body_position = -1 //Indicates where the rat's body is left when the player depossesses it.
VAR secretary_position = -1 //Indicates the position of the secretary in the precinct.
VAR can_interact_with_rat = false //Indicates whether you can interact with the rat at a certain stage.
VAR has_key = false //Stores wether you have the key for the evidence room.
VAR player_prev_position = -1 //Indicates what the player's previous position was.
VAR player_position = -1 //Indicates the player's current position in the map.
VAR files_left_to_read = 2 //Shows that Bob can read a certain amount of files before he gets too tired.
VAR questions_left = 4 //The amount of questions Bob has energy left for.

//Initialize some variables
~ where_does_rat_spawn = RANDOM(1,2) //Gets a random place to spawn the rat.
~ secretary_position = INSIDE_FRONT //Sets the secretary's position.
~ player_position = OUTSIDE_FRONT  //Sets the player's starting position.

{debug:
    [[[[[[[[[[[[[[[[[[[[ DEBUGGING ]]]]]]]]]]]]]]]]]]]]]]
    ~files_left_to_read = 0
    ~questions_left = 1
    -> 4k_interview_suspects(4k_interview_suspects)
}

//======================================= INTRODUCTION ==============================================

-> main
=== main ===
-> 1_intro_to_case

=== 1_intro_to_case === 
The sound of the rain patters against the windscreen. The drops stuck to the driver’s side window reflected the orange glow of the streetlights onto Valentine’s face. 
Bob: “Another miserable night, guess it’s never going to be a nice one when it comes to cases like these.”
Bob brings the car to a stop at a red light one block from the precinct. He looks around not seeing another car anywhere, though with the tall reaching buildings of the city he wasn’t able to see much. He looks down to his right at the passenger side seat at the case file resting there, attached to the front was the grainy black and white photo of a smiling young man. Valentine sighs quietly as he rubs the back of his head.

Choose one of the options below.

*Open the file
    ->1a_open_case_file
*[Leave it alone]
    Bob leaves the file and starts talking to himself.
    -> 1b_rambling_and_accident

=== 1a_open_case_file ===
    Bob reaches over for the file and flicks it open 
    Bob: “hmm...”
    inside was all the details on the case, "Teen Rhys Miller found dead in the wheatfield near his father’s mill", "his father had reported that 2 of his friends were over at his house that night"
    -> 1b_rambling_and_accident

=== 1b_rambling_and_accident ===
Bob: “Its always the kids who seem to have their whole life ahead of em that lose it all so quickly, now I have to go question these 2 twenty something year olds and that’s going to go great. They don’t talk to anyone but each other from experience”
He rambles on to himself. It was a new terrible habit he had picked up, but he found speaking to himself helped him remember it more.
-> 2_crash_and_out_of_body_experience
    

=== 2_crash_and_out_of_body_experience ===
Bob blinks as he pulls himself back to reality he looks up at the now orange light, he nods and starts to pull out as the light turns red again, having missed the green being lost in his thoughts. The light turns red and a car to Bob's left comes hurtling through the intersection right into the driver’s side of Bob’s car. Everything fades from existence around him, leaving him in a black void.
*[Hello..?]
    Bob: “H-Hello...? What’s going on?”
    ->2a_out_of_body
*...
    ->2a_out_of_body

=== 2a_out_of_body ===
Valentine floats in the black void, he tries to move his arms to touch himself but can’t feel his arms moving, let alone the chest he was trying to touch. After what felt like a lifetime, he hears someone talking, the flash of blue and red lights fills his vision before the world comes back to him. He’s floating above a car wreck; he sees his own car and a paramedic half inside. The other driver is sitting on the back of the ambulance looking mostly ok, the paramedic below him calls out to the other who was tending to the conscious driver 
Paramedic: “I have a pulse, he needs serious help real soon”
The paramedic pulls Bob’s lifeless body out of the wreck and proceeds to do CPR on him. 
Bob: “Wh.. What’s happening?”
Bob’s spirit feels a pull back towards his body as he is getting revived.
Bob: “I have to get to the precinct as soon as possible. Those suspects are getting released tonight.”
Bob figures out how to move in his new ghostly state and makes his way to the precinct down the street.

#IMAGE: ../game_resources/police_station.png

-> 3a_front_of_precinct

//======================================= OUTSIDE ==============================================

=== 3a_front_of_precinct ===
~ player_prev_position = player_position
~ player_position = OUTSIDE_FRONT
Bob is standing in front of the precinct.
+ Try the door
    {is_possessing_a_rat:
     Bob can not open the door while possessing the rat.
    - else:
    Bob tries to open the door, but fails. He has no effect on the physical world. 
    Bob: "{I’ve got to find another way in... |Can’t go in here, there must be another way... |I’ve tried that already I can’t get in, I have to try another way...}"
    }
    -> 3a_front_of_precinct
+ Go around the right of the precinct -> 3c_right_of_precinct
+ Go around the left of the precinct -> 3b_left_of_precinct

=== 3b_left_of_precinct ===
~ player_prev_position = player_position
~ player_position = OUTSIDE_LEFT
~ can_interact_with_rat = where_does_rat_spawn == 1 && not is_possessing_a_rat
Bob’s at the left side of the precinct there’s a closed window where he can see the secretary casually doing her work inside. She doesn't seem to notice him. {can_interact_with_rat : There appears to be a rat dying on the floor.}
+ Try the window
    {is_possessing_a_rat:
        Bob can not open the window while possessing the rat.
    - else:
        Bob tries to open the window, but fails. He has no effect on the physical world. 
    Bob: "{I’ve got to find another way in... |Can’t go in here, there must be another way... |I’ve tried that already I can’t get in, I have to try another way...}"
    }
    -> 3b_left_of_precinct
+ Go to the back of the precinct -> 3d_back_of_precint
+ Go to the front of the precinct -> 3a_front_of_precinct
+ {can_interact_with_rat} Pick up dying rat
    <- 3e_pick_up_dying_rat
    -> 3b_left_of_precinct

=== 3c_right_of_precinct ===
~ player_prev_position = player_position
~ player_position = OUTSIDE_RIGHT
Bob’s at the right side of the precinct. There is nothing except a big wall with a small crack that seems to lead into the wall.
+ Go to the back of the precinct -> 3d_back_of_precint
+ Go to the front of the precinct -> 3a_front_of_precinct
+ {is_possessing_a_rat} Go through crack.
    #CLEAR
    #IMAGE: ../game_resources/map.png
    Bob, while possessing the rat's body, climbs through the crack.
    -> 4a_bathroom

=== 3d_back_of_precint ===
~ player_prev_position = player_position
~ player_position = OUTSIDE_BACK
~ can_interact_with_rat = where_does_rat_spawn == 2 && not is_possessing_a_rat
Bob's at the back of the precinct. There's some trash but no way to enter the precinct. {can_interact_with_rat: There appears to be a rat dying on the floor.}
+ Go around the right of the precinct -> 3c_right_of_precinct
+ Go around the left of the precinct -> 3b_left_of_precinct
+ {can_interact_with_rat} Pick up dying rat
    <- 3e_pick_up_dying_rat
    -> 3d_back_of_precint
    

=== 3e_pick_up_dying_rat ===
Bob picks up the rat and feels his own life force enter into it. He feels sick and can almost hear the rat's thoughts. He becomes one with the rat. 
    Bob: "What the fuck!"
    Rat: "SQEEECK!"
<- possess_rat(true)
-> DONE

//======================================= INSIDE ==============================================

=== 4a_bathroom ===
~ player_prev_position = player_position
~ player_position = INSIDE_BATHROOM
{player_prev_position != player_position: 
    <- bob_enters_room
}
+ [Go to the detectives office.]
    -> 4b_office
+ {is_possessing_a_rat && has_learned_to_unpossess_rat} [Unpossess the rat.]
    <- possess_rat(false)
    -> 4a_bathroom
+ {rat_body_position == player_position && not is_possessing_a_rat && not is_possessing_the_secretary} [Possess rat.] 
    <- possess_rat(true)
    -> 4a_bathroom
+ {is_possessing_the_secretary && has_learned_to_unpossess_rat} [Unpossess the secretary.]
    <- possess_secretary(false)
    -> 4a_bathroom
+ {secretary_position == player_position && not is_possessing_a_rat && not is_possessing_the_secretary} [Possess secretary.] 
    <- possess_secretary(true)
    -> 4a_bathroom

=== 4b_office ===
~ player_prev_position = player_position
~ player_position = INSIDE_OFFICE
{player_prev_position != player_position: 
    <- bob_enters_room
    The {not (secretary_position == player_position): empty} office is filled with a few desks where the detectives do their work during the day. There's a door for the back office hallway that leads to the cells. There's a door that leads to the front of the precinct.
    {not has_key && not is_possessing_a_rat: There might be something in here for us to find.}
}
+ [Go to the back office hallway.]
    -> 4c_backoffice
+ [Go to the precinct front.] 
    -> 4d_front
+ [Go to the bathroom.]
    -> 4a_bathroom 
+ {not has_key && not is_possessing_a_rat && not 4i_pull_key_out} [Look for key]
    <- 4h_look_for_key(4h_look_for_key)
    -> 4b_office
+ {is_possessing_a_rat && 4h_look_for_key && not 4i_pull_key_out} [Pull out key]
    <- 4i_pull_key_out
    -> 4b_office
+ {4i_pull_key_out && not has_key} [Pick up key] 
    {is_possessing_a_rat: 
        Bob can not pick up the key while posessing the rat.
        {has_learned_to_unpossess_rat: Bob: "Maybe I should try possess something a little.. bigger"}
    -else:
        {is_possessing_the_secretary:
            Bob, possessing the secretary, picks up the key and puts it in her pocket.
            ~has_key = true
            Bob: "What's happening to me..."
            He feels a pull back to his body. 
        -else:
            Bob can pick up the key. He has no affect on the physical world.
            Bob: "Maybe I should try possess something."
        }
    }
    -> 4b_office
+ {is_possessing_a_rat && has_learned_to_unpossess_rat} [Unpossess the rat.]
    <- possess_rat(false)
    -> 4b_office
+ {rat_body_position == player_position && not is_possessing_a_rat && not is_possessing_the_secretary} [Possess rat.] 
    <- possess_rat(true)
    -> 4b_office
+ {is_possessing_the_secretary && has_learned_to_unpossess_rat} [Unpossess the secretary.]
    <- possess_secretary(false)
    -> 4b_office
+ {secretary_position == player_position && not is_possessing_a_rat && not is_possessing_the_secretary} [Possess secretary.] 
    <- possess_secretary(true)
    -> 4b_office

=== 4c_backoffice ===
~ player_prev_position = player_position
~ player_position = INSIDE_BACKOFFICE
{player_prev_position != player_position: 
    <- bob_enters_room
    The back office hallway is dark and narrow
    {player_prev_position == INSIDE_CELLS:
        <>, it leads to the detectives office
        <>. There's a door leading to the precinct front.
    -else:
        {player_prev_position == INSIDE_OFFICE:
            <>, it leads to the cells
            <>. There's a door leading to the precinct front.
        -else:
            <>, it leads to the detectives office, and the cells.
        }
    }
}
+ [Go to the cells.]
    -> 4e_cells
+ [Go to the precinct front.]
    -> 4d_front
+ [Go to the detectives office.]
    -> 4b_office
+ {is_possessing_a_rat && has_learned_to_unpossess_rat} [Unpossess the rat.]
    <- possess_rat(false)
    -> 4c_backoffice
+ {rat_body_position == player_position && not is_possessing_a_rat && not is_possessing_the_secretary} [Possess rat.] 
    <- possess_rat(true)
    -> 4c_backoffice
+ {is_possessing_the_secretary && has_learned_to_unpossess_rat} [Unpossess the secretary.]
    <- possess_secretary(false)
    -> 4c_backoffice
+ {secretary_position == player_position && not is_possessing_a_rat && not is_possessing_the_secretary} [Possess secretary.] 
    <- possess_secretary(true)
    -> 4c_backoffice

=== 4d_front ===
~ player_prev_position = player_position
~ player_position = INSIDE_FRONT
{player_prev_position != player_position:
    <- bob_enters_room
    There's a desk in the middle of the small room. The secretary does her work there. This is where people enter the precinct. There's a small door to the evidence room.
}
+ [Go to the back office hallway.]
    -> 4c_backoffice
+ [Go to the detectives office.]
    -> 4b_office
+ {not 4f_open_evidence_room && not (has_key && is_possessing_the_secretary)}[Open evidence room door.]
    {is_possessing_a_rat: 
        Bob can not open the door while posessing the rat.
        {has_learned_to_unpossess_rat: Bob: "Maybe I should try possess something a little.. bigger"}
    -else:
        {is_possessing_the_secretary:
            <- 4g_try_open_evidence_room
        -else:
            Bob can not open the door. He has no affect on the physical world.
            Bob: "Maybe I should try possess something."
        }
    }
    -> 4d_front
+ {not 4f_open_evidence_room && (has_key && is_possessing_the_secretary)}[Unlock and open evidence room door.]
    <- 4f_open_evidence_room
    -> 4d_front
+ {4f_open_evidence_room}[Go to evidence room and check out evidence.]
    #CLEAR
    -> 4j_go_through_evidence(4j_go_through_evidence)
+ {is_possessing_a_rat && has_learned_to_unpossess_rat} [Unpossess the rat.]
    <- possess_rat(false)
    -> 4d_front
+ {rat_body_position == player_position && not is_possessing_a_rat && not is_possessing_the_secretary} [Possess rat.] 
    <- possess_rat(true)
    -> 4d_front
+ {is_possessing_the_secretary && has_learned_to_unpossess_rat} [Unpossess the secretary.]
    <- possess_secretary(false)
    -> 4d_front
+ {secretary_position == player_position && not is_possessing_a_rat && not is_possessing_the_secretary} [Possess secretary.] 
    <- possess_secretary(true)
    -> 4d_front

=== 4e_cells ===
~ player_prev_position = player_position
~ player_position = INSIDE_CELLS
{player_prev_position != player_position:
    <- bob_enters_room
    The 2 cells are right next to each other. Inside of them is the 2 suspects of the murder of our victim{1a_open_case_file or read_about_the_father: Rhys Miller}. {not has_learned_to_unpossess_rat: There seems to be a small crack that leads into the evidence room.}
}
+ [Go to the back office hallway.]
    -> 4c_backoffice
+ {not has_learned_to_unpossess_rat} [Try and fit through the small crack.]
    Bob tries to fit his rat body through the small crack, but it does not work. Bob tries again, but harder. He squeezes so hard he feels his spirit escape from the rat's body.
    ~has_learned_to_unpossess_rat = true
    <- possess_rat(false)
    -> 4e_cells
+ {is_possessing_a_rat && has_learned_to_unpossess_rat} [Unpossess the rat.]
    <- possess_rat(false)
    -> 4e_cells
+ {rat_body_position == player_position && not is_possessing_a_rat && not is_possessing_the_secretary} [Possess rat.] 
    <- possess_rat(true)
    -> 4e_cells
+ {is_possessing_the_secretary && has_learned_to_unpossess_rat} [Unpossess the secretary.]
    <- possess_secretary(false)
    -> 4e_cells
+ {secretary_position == player_position && not is_possessing_a_rat && not is_possessing_the_secretary} [Possess secretary.] 
    <- possess_secretary(true)
    -> 4e_cells

=== 4f_open_evidence_room === //THIS ALSO STORES THAT WE'VE TRIED THIS AND THE DOOR IS OPEN
Bob, using the secretary's body, uses the key to unlock and open the evidence room door.
-> DONE

=== 4g_try_open_evidence_room === //THIS ALSO STORES THAT WE'VE TRIED THIS
Bob tries to open the door but it seems locked.
Bob: "{~There should be a key somewhere in the office." |Maybe there's a key in the office." |There could be something in the office I can use to get in here."}
->DONE

=== 4h_look_for_key(lookedAlready) ===
{lookedAlready:
    {is_possessing_the_secretary:
        Bob: "I just can't reach it back there. I need something smaller."
    -else: 
        Bob: "I just can't reach it back there. Maybe I should try possessing something."
    }
-else:
    Bob{is_possessing_the_secretary:, possessing the secretary,} looks around the office for the key. Bob checks under the desk and notices something shiny far in the back. 
    {is_possessing_the_secretary:
        <> He tries to reach it but it's too far and narrow for the secretary's arm to reach. 
        Bob: "I just can't reach it. I need something smaller."
    -else: 
        <> He tries to get it, but he can't seem to interact with it in his ghostly state.
        Bob: "I just can't reach it. Maybe I should try possessing something."
    }
}
->DONE

=== 4i_pull_key_out ===
Using his rat body, Bob squeezes behing the desk and pulls out the key onto the floor.
-> DONE

=== 4j_go_through_evidence(has_been_called) ===
{not has_been_called: 
    Bob feels another pull back to his body. He cannot keep doing this, the pull is getting stronger. There's 4 files to read, but he can only read {files_left_to_read} of them. He needs to be careful about what he chooses to read. He still needs to ask some questions to the 2 suspects that's locked up. He can only ask them questions about on what he's read.
}
{files_left_to_read <= 0: //EXIT THIS "GO THROUGH EVIDENCE" LOOP
    *Continue
        #CLEAR
        Bob: "I feel the pull getting stronger. I have enough energy to interview the suspects before I get pulled back into my body."
        -> 4k_interview_suspects(4k_interview_suspects)
-else:
    {files_left_to_read > 1:
        Bob: "Hmm I can only pick {files_left_to_read} files
    -else:
        Bob: "Hmm I can only pick {files_left_to_read} more file
    }
    <>, what is the most important."
    * [Read about the crime scene]
        ~files_left_to_read--
        <-read_about_the_crime_scene
        -> 4j_go_through_evidence(4j_go_through_evidence)
    * [Read about Eric Miller, the victim's father]
        ~files_left_to_read--
        <-read_about_the_father
        -> 4j_go_through_evidence(4j_go_through_evidence)
    * [Read about Richard Smith, the male suspect]
        ~files_left_to_read--
        <-read_about_richard
        -> 4j_go_through_evidence(4j_go_through_evidence)
    * [Read about Tara Van Dyke, the female suspect]
        ~files_left_to_read--
        <-read_about_tara
        -> 4j_go_through_evidence(4j_go_through_evidence)
}
    
=== 4k_interview_suspects(has_been_called) ===
{not has_been_called: Bob walks the possessed secretary to the cells to question the 2 suspects.}
{questions_left <= 0: //EXIT THIS "INTERVIEW" LOOP
    *Continue
        #CLEAR
        Bob: "I can't keep this up anymore!"
        Bob gets sucked out of the secretary's body. He gets pulled out of the precinct down the street past where his car lays wrecked in the rain. Buildings and streetlights flash past him. He reaches a hospital where the ambulance took his body. He sees his body getting revived and there's a bright light. His spirit entered his body once again. 
        -> 5_hospital
-else:
    {questions_left > 1:
        Bob can ask {questions_left} {has_been_called:more} questions.
    -else:
        Bob can ask {questions_left} more question.
    }
    
    + Question Tara Van Dyke
        **{read_about_tara} Question about herself.
            Bob: "Tara, why don't you want to talk to us? We're here to help and figure out what happened to your frined Rhys."
            Tara: "I know, but we did not do anything wrong. How do you expect us to feel finding our friend out in the field. Dead."
            ~questions_left--
            -> 4k_interview_suspects(4k_interview_suspects)
        **{read_about_richard} Question about {read_about_tara:her and }Richard being wealthy.
            {read_about_tara:
                Bob: "So Tara, how come you and Richard coming from wealthy families, were best friends with the poor Miller boy?"
                Tara: "Not Everything is about money, we know the Miller's needed money to keep running the farm, but that wasn't the reason for our friendship. Rhys was a good person that's all that matters."
            -else:
                Bob: "So Tara, what do you think Richard has to do with this all of this. He does look like a prime suspect, his family wants to buy the Miller's farm? What better way to make them sell than to push old man Miller to the brink and killing his son?"
                Tara: "What! That's crazy. Richard has a big reputation to uphold for his family, he wouldn't do anything like this. And seems to me old man Miller could use the money he's going to loose the farm."
            }
            ~questions_left--
            -> 4k_interview_suspects(4k_interview_suspects)
        **{read_about_the_father} Question about Rhys's father.
            Bob: "Tara how was Rhys's father treating you up on the farm.{read_about_tara: Being a foreign family from the Netherlands and him being a proud American farmer how did he handle that.}"
            Tara: "He treated us well, but the situation with money got to him. Sometimes he took it out on poor Rhyssie."
            ~questions_left--
            -> 4k_interview_suspects(4k_interview_suspects)
        **{read_about_the_crime_scene} Question about scene.
            Bob: "I know this might be hard, but could you describe the scene to me when you and Richard supposedly found Rhys."
            Tara: "He was laying next to the mill, I've seen him climb those mills ever since we were young. He would never fall off someone had to have done something to make him fall. His dad was working on that mill the day before."
            ~questions_left--
            -> 4k_interview_suspects(4k_interview_suspects)
        ** Question about her whereabouts.
            Bob: "Where were you the 2 or so hours before going to the Miller's farm?"
            Tara: "Me and Richard were getting ready to go to visit Rhys for the weekend. There's no one to varify, but it's the truth."
            ~questions_left--
            -> 4k_interview_suspects(4k_interview_suspects)
        ++ Rather question someone else
            -> 4k_interview_suspects(4k_interview_suspects)
    + Question Richard Smith
        **Question about Tara.
            Bob: "You and Tara seem to have a real close friendship{read_about_tara:, so does Rhys and Tara}. 
            {read_about_tara:
                <> I can't help to wonder there was some sort of love triangle between the three of you. 
            -else:
                <> If you are trying to protect her from something she did, you need to tell me. The best way to help her is to tell me everything you know.
            }<>"
            Richard: "She did not do anything, neither did I. She and Rhys where just friends and she would never hurt a fly."
            ~questions_left--
            -> 4k_interview_suspects(4k_interview_suspects)
        **{read_about_richard} Question about himself
            Bob: "How about you, I hear you're a pretty wealthy young man. How did you and a farmer's boy become such good friends?"
            Richard: "Me and Rhys met at school and it was never about money for us. It affected his dad though I thought my family could help them out by buying the farm for a good amount of money but Rhys's dad did not like that at all."
            ~questions_left--
            -> 4k_interview_suspects(4k_interview_suspects)
        **{read_about_the_father} Question about Rhys's father.
            Bob: "What can you tell me about Rhys's father?"
            Richard: "He's an old man with some problems. Money is getting to him, he's about to lose the farm and sometimes he would take it out on Rhys and beat him."
            ~questions_left--
            -> 4k_interview_suspects(4k_interview_suspects)
        **{read_about_the_crime_scene} Question about scene.
            Bob: "You and Tara found Rhys's body, what can you tell me about when you found him."
            Richard: "We found him next to that mill his father's been working on the past week. Rhys was the best climber I knew he would never have fallen off that mill."
            ~questions_left--
            -> 4k_interview_suspects(4k_interview_suspects)
        ** Question about her whereabouts.
            Bob: "Where were you the morning of the death of Rhys Miller?"
            Richard: "I was at my house waiting for Tara because we wanted to go over to Rhys later the day."
            ~questions_left--
            -> 4k_interview_suspects(4k_interview_suspects)
        ++ Rather question someone else
            -> 4k_interview_suspects(4k_interview_suspects)

}

=== 5_hospital ===
Bob wakes up the morning in the hospital. The Police Chief Johnson is sitting next to his hospital bed, half asleep. He snaps awake and tends to Bob.
Chief Johnson: "Oh look at you, you're awake. For a while there they thought you weren't going to make it. Gave us all a big scare. The other driver a fella called Peter got away almost unharmed."
Bob: "I was on my way to look at the case... I'm sorry chief."
Chief Johnson: "No worries Bob, I'll have Greg have a look at it. You need to rest. We closed the precinct for the day anyway apparently the new secretary experienced some spooky stuff last night and refuses to come in to the office."
Bob: "I.. I don't know what happened, but I think I know who did it... It was..."

VAR chosenMurderer = -1
+ [Eric Miller]
    ~chosenMurderer = 0
    <> The boy's own father, Eric Miller, he's been having trouble with money for a few years now and he has a history with abusing the little boy. It was him.
+ [Tara Van Dyke]
    ~chosenMurderer = 1
    <> The boy's friend, Tara Van Dyke, she used him to get close to Richard. And when he started to notice her intent was only to get together with Richard for his money she killed him. It was her.
+ [Richard Smith]
    ~chosenMurderer = 2
    <> The boys best friend, Richard Smith, his family has been wanting to buy that farm the past 2 years. He always wants to prove himself to his family and what better way than to kill the old man Eric's son to make him go insane and sell the farm to the Smith's.

- ->6_court

=== 6_court ===
{chosenMurderer:
- 1: The court is seated, and the evidence that you provided is read to the court. Tara sits there in cuffs, tears streaming down her face as the evidence you provided to the court is shown to the jury. All the while Richard and Eric watch on. Bob sighs and looks to Eric who sits there with a smug look on his face. A member of the jury stands saying, “We the jury find Tara Van Dyke, guilty on all charges.” Richard and Tara both break down whilst Eric laughs to himself. He’s the first to leave the court and enjoy his life as a free man.
- 2: The court is seated, and the evidence that you provided is read to the court. Richard sits and watches the court with a sunken face. He looks to Bob, his eyes defeated and broken. Bob looks away in shame, he looks to Tara who is pressed into her mother’s side, crying all the while. Bob sighs and looks to Eric who sits there with a smug look on his face. Maybe it was the justice for his kid, but Bob couldn’t shake the feeling of malice of that smile. A member of the jury stands saying, “We the jury find Richard Smith, guilty on all charges.” Tara breaks down even more so than before, but Richard just sits and accepts his faith. Eric laughs to himself. He’s the first to leave the court and enjoy his life as a free man.
- 0:The court is seated, and the evidence that you provided is read to the court. Eric is dragged out, fighting, and shouting at the jury all sorts of obscenities. Bob looks around the room to the other two suspects who were seated together. Richard has his arm wrapped around Tara whispering quietly. A member of the jury stands “We the jury find Eric Miller, guilty for the murder of his son Rhys Miller.” Both friends sigh softly and smile. They embrace each other as Eric is taken away. Both friends stand and leave the court, ready to enjoy their free lives together. 
}
-> credits

//======================================= METHODS ==============================================

=== read_about_the_crime_scene ===
Bob reads the file.
Crime Scene Investigation Report.
The body was found on the ground next to the mill on the Miller's farm. There's a loose pipe where the victim fell off. Victim seemed to have climbed up on the mill for some reason and fallen off. Could've been an accident, but we suspect foul play since the pipe did not break it was loosened. The only loosened pipe on the whole mill.
->DONE

=== read_about_the_father ===
Bob reads the file.
Name: Eric Miller
Gender: Male
Family: He took over his family's mill and has been running it for almost 30 years now.
Reason for arrest: [Not arrested] Not enough evidence 
Notes: We could not arrest him as we did not have enough evidence. We do know he has a bad relationship with Richard's family and they've been wanting to buy the family mill from Eric a while now. 
->DONE

=== read_about_richard ===
Bob reads the file.
Name: Richard Smith
Gender: Male
Family: Richard comes from a rich family with a good reputation.
Reason for arrest: Placed on the scene by father of victim.
Notes: He seems to be very serious, implying it was not him and he would never let his family's reputation down like that. He's usually seen with friends that have the same financial status as him. 
-> DONE

=== read_about_tara ===
Bob reads the file.
Name: Tara Van Dyke
Gender: Female
Family: Dutch immigrants who found fortune in the gold rush.
Reason for arrest: Placed on the scene by father of victim.
Notes: She's very nervous and doesn't like to talk in front of people. She only has 2 best friends, the victim Rhys Miller, and the other suspect Richard Smith. She seems to feel comfortable and talks to Richard Smith.
-> DONE

=== possess_rat(isPossessing) ===
    {isPossessing: 
        Bob is now possessing the rat!
    -else:
        Bob has unpossessed the rat!
    }
    {not isPossessing: 
        ~rat_body_position = player_position
    }
    ~ is_possessing_a_rat = isPossessing
    -> DONE
    
=== possess_secretary(isPossessing) ===
    {isPossessing: 
        Bob is now possessing the secretary!
    -else:
        Bob has unpossessed the secretary!
    }
    {not isPossessing: 
        ~secretary_position = player_position
    }
    ~ is_possessing_the_secretary = isPossessing
    -> DONE

=== bob_enters_room ===
{player_prev_position != player_position:
    Bob has entered the
    {player_position:
     - INSIDE_BATHROOM: <> precinct bathrooms
     - INSIDE_OFFICE: <> detective office
     - INSIDE_FRONT: <> precinct front
     - INSIDE_BACKOFFICE: <> back office hallway
     - INSIDE_CELLS: <> cells
     - INSIDE_EVIDENCE_ROOM: <> evidence room
     - else: room
    }
    {player_prev_position: 
     - OUTSIDE_RIGHT: <> from outside the precinct.
     - INSIDE_BATHROOM: <> from the precinct bathrooms.
     - INSIDE_OFFICE: <> from the detective offices.
     - INSIDE_FRONT: <> from the precinct front.
     - INSIDE_BACKOFFICE: <> from the back office hallway.
     - INSIDE_CELLS: <> from the cells.
     - INSIDE_EVIDENCE_ROOM: <> from the evidence room.
     - else: <>.
    }
    
    {rat_body_position == player_position && not is_possessing_a_rat: The rat's dying body is in this room}
    {secretary_position == player_position && not is_possessing_the_secretary: The secretary is in this room}
}

{player_position == secretary_position: 
    {is_possessing_a_rat:
        The secretary sees the rat. 
        Secretary: "{~Oh shit, a rat!" |Ugh this rat is ugly, it kinda reminds me of my ex..." |Oh that's an ugly rat. Shoo shoo go away." |Shoo shoo go away rat!" |Ahh a rat! I need a break from this place." |I'm not even surprised seeing ugly rats like that anymore." |I need to get out of this town, the rats are almost bigger than the cats." }
    -else:
        {not is_possessing_the_secretary:
            {RANDOM(1,50) == 49: //A 0.02% chance this could happen.
                Secretary: "Oh I can feel your presence! Are you there ghost... Haha that lady in the street the other day was crazy saying stuff like that. There's no such thing as ghosts"
            -else: //There's a 60% chance the secretary says something when you enter the room as a ghost.
                {RANDOM(1,10) > 4:
                    Secretary: "{~Oh it's getting cold in here." |Oh I feel creeped out... I should stop working this late" |Did something just move back there? Must be my eyes playing tricks on me, I'm working too much."}
                }
            }
        }
    }
}

->DONE

=== credits ===
    Thank you for playing our game :)
    Be sure to check out our github repo on this game at - www.github.com/Michael2150/Loose-Ends
    -> END
VAR debug = true //Shows the variable values on the top of the story.
VAR is_possessing_a_rat = false //Stores whether you are possessing the rat.
VAR is_possessing_the_secretary = false //Stores whether you are possessing the secretary.
VAR has_learned_to_unpossess_rat = true //This indicates that the player has learned the ability to unpossess things.
VAR where_does_rat_spawn = -1 //Indicates the place where the rat spawns.
VAR rat_body_position = -1 //Indicates where the rat's body is left when the player depossesses it.
VAR secretary_position = -1 
VAR can_interact_with_rat = false //Indicates whether you can interact with the rat at a certain stage.
VAR player_position = -1 //Indicates the player's current position in the map.
VAR	OUTSIDE_FRONT = 1
VAR	OUTSIDE_LEFT= 2
VAR	OUTSIDE_BACK = 3
VAR	OUTSIDE_RIGHT = 4
VAR	INSIDE_BATHROOM = 5
VAR	INSIDE_OFFICE = 6
VAR	INSIDE_FRONT = 7
VAR	INSIDE_CELLS = 8
VAR	INSIDE_BACKOFFICE  = 9
VAR	INSIDE_EVIDENCE_ROOM = 10

~ where_does_rat_spawn = RANDOM(1,2) //Gets a random place to spawn the rat.

{debug:
    where_does_rat_spawn = {where_does_rat_spawn}
}

-> main
=== main ===
-> 1_intro_to_case

=== 1_intro_to_case === 
The sound of the rain patters against the windscreen. The drops stuck to the driver’s side window reflected the orange glow of the streetlights onto Valentine’s face. 
Bob: “Another miserable night, guess it’s never going to be a nice one when it comes to cases like these.”
Bob brings the car to a stop at a red light one block from the precinct. He looks around not seeing another car anywhere, though with the tall reaching buildings of the city he wasn’t able to see much. He looks down to his right at the passenger side seat at the case file resting there, attached to the front was the grainy black and white photo of a smiling young man. Valentine sighs quietly as he rubs the back of his head.

*Open the file
    Bob reaches over for the file and flicks it open 
    Bob: “hmm...”
    inside was all the details on the case, "Teen Rhys Miller found dead in the wheatfield near his father’s mill", "his father had reported that 2 of his friends were over at his house that night"
    -> 1a_rambling_and_accident
*[Leave it alone]
    Bob leaves the file and starts talking to himself.
    -> 1a_rambling_and_accident
    
=== 1a_rambling_and_accident ===
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

#IMAGE: game_resources/police_station.png

-> 3a_front_of_precinct


=== 3a_front_of_precinct ===
Bob is standing in front of the precinct.
+ Try the door
    {is_possessing_a_rat:
     Bob can not open the door while possessing the rat.
    - else:
    Bob tries to open the door, but fails. He has no effect on the physical world. 
    {"Bob: “I’ve got to find another way in...”" | "Bob: “Can’t go in here, there must be another way...”" | "Bob: “I’ve tried that already I can’t get in, I have to try another way..."}
    }
    -> 3a_front_of_precinct
+ Go around the right of the precinct -> 3c_right_of_precinct
+ Go around the left of the precinct -> 3b_left_of_precinct

=== 3b_left_of_precinct ===
~ can_interact_with_rat = where_does_rat_spawn == 1 && not is_possessing_a_rat
Bob’s at the left side of the precinct there’s a closed window where he can see the secretary casually doing her work inside. She doesn't seem to notice him. {can_interact_with_rat : There appears to be a rat dying on the floor.}
+ Try the window
    {is_possessing_a_rat:
        Bob can not open the window while possessing the rat.
    - else:
        Bob tries to open the window, but fails. He has no effect on the physical world. 
    {"Bob: “I’ve got to find another way in..."” | Bob: “Can’t go in here, there must be another way...” | Bob: “I’ve tried that already I can’t get in, I have to try another way..."}
    }
    -> 3b_left_of_precinct
+ Go to the back of the precinct -> 3d_back_of_precint
+ Go to the front of the precinct -> 3a_front_of_precinct
+ {can_interact_with_rat} Pick up dying rat
    <- 3e_pick_up_dying_rat
    -> 3b_left_of_precinct

=== 3c_right_of_precinct ===
Bob’s at the right side of the precinct. There is nothing except a big wall with a small crack that seems to lead into the wall.
+ Go to the back of the precinct -> 3d_back_of_precint
+ Go to the front of the precinct -> 3a_front_of_precinct
+ {is_possessing_a_rat} Go through crack.
    Bob has entered the precinct.
    -> 4a_bathroom

=== 3d_back_of_precint ===
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


=== 4a_bathroom ===
~ player_position = INSIDE_BATHROOM
+ Go to Office -> 4b_office
+ Go back through crack -> 3c_right_of_precinct
+ {is_possessing_a_rat && has_learned_to_unpossess_rat} Unpossess the rat 
    <- possess_rat(false)
    -> 4a_bathroom
+ {rat_body_position == player_position && not is_possessing_a_rat} Possess rat 
    <- possess_rat(true)
    -> 4a_bathroom

=== 4b_office ===
~ player_position = INSIDE_OFFICE
+ Go to backoffice -> 4c_backoffice
+ Go to front -> 4d_front
+ Go to bathroom -> 4a_bathroom 
+ {is_possessing_a_rat && has_learned_to_unpossess_rat} Unpossess the rat 
    <- possess_rat(false)
    -> 4b_office
+ {rat_body_position == player_position && not is_possessing_a_rat} Possess rat 
    <- possess_rat(true)
    -> 4b_office

=== 4c_backoffice ===
~ player_position = INSIDE_BACKOFFICE
+ Go to cells -> 4e_cells
+ Go to front -> 4d_front
+ Go to office -> 4b_office
+ {is_possessing_a_rat && has_learned_to_unpossess_rat} Unpossess the rat 
    <- possess_rat(false)
    -> 4c_backoffice
+ {rat_body_position == player_position && not is_possessing_a_rat} Possess rat 
    <- possess_rat(true)
    -> 4c_backoffice

=== 4d_front ===
~ player_position = INSIDE_FRONT
+ Go to backoffice -> 4c_backoffice
+ Go to office -> 4b_office
+ Go to evidence room -> 4e_evidence_room
+ {is_possessing_a_rat && has_learned_to_unpossess_rat} Unpossess the rat 
    <- possess_rat(false)
    -> 4d_front
+ {rat_body_position == player_position && not is_possessing_a_rat} Possess rat 
    <- possess_rat(true)
    -> 4d_front

=== 4e_evidence_room ===
~ player_position = INSIDE_EVIDENCE_ROOM
+ Go to front -> 4d_front
+ {is_possessing_a_rat && has_learned_to_unpossess_rat} Unpossess the rat 
    <- possess_rat(false)
    -> 4e_evidence_room
+ {rat_body_position == player_position && not is_possessing_a_rat} Possess rat 
    <- possess_rat(true)
    -> 4e_evidence_room

=== 4e_cells ===
~ player_position = INSIDE_CELLS
+ Go to backoffice -> 4c_backoffice
+ {is_possessing_a_rat && has_learned_to_unpossess_rat} Unpossess the rat 
    <- possess_rat(false)
    -> 4e_cells
+ {rat_body_position == player_position && not is_possessing_a_rat} Possess rat 
    <- possess_rat(true)
    -> 4e_cells


=== possess_rat(isPossessing) ===
    {isPossessing: 
        Bob is now possessing a rat!
    -else:
        Bob has unpossessed the rat!
    }
    {not isPossessing: 
        ~rat_body_position = player_position
    }
    ~ is_possessing_a_rat = isPossessing
    -> DONE
    

=== credits ===
    Programming: Michael Gerber
    Story: Sean Mackey
    Design: Dominika Kmiecik
    -> END
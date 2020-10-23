/***
* Name: Final_project
* Author: sdelo
* Description: guide agents to stages to maximize utility
* Tags: Tag1, Tag2, TagN
***/
model Final_project

global{
	int AmountOfGuests <- 32;
	int AmountOfDoctors <- 2;
	int AmountOfSicks <- 4;
	int AmountOfStars <- 4;
	int AmountOfJournalists <- 4;
	int AmountOfResearchers <- 4;
	int AmountOfStages <- 4;
	int mm <- 0;
	int rr <- 0;
	float alpha <- 0.1;
	
	init{
		
		create FestivalGuest number:AmountOfGuests{
			location <- any_location_in(circle(20,{50,50}));
			begin<-true;
			hunger <- 330.0 + rnd(500.0);
			thirst <- 370.0 + rnd(700.0);
			hungry <- false;
			thirsty <- false;
			PreferedSoundQuality <- rnd(10)/10;
			PreferedLightShow <- rnd(10)/10;
			PreferedArtist <- rnd(10)/10;
			PreferedDecor <- rnd(10)/10;
			PreferedDancers <-rnd (10)/10;
			PreferedView <- rnd(10)/10;
			redColor <- 1/2*PreferedSoundQuality*255+1/4*PreferedLightShow*255+1/4*PreferedDecor*255;
			greenColor <- 1/2*PreferedArtist*255+1/4*PreferedLightShow*255+1/4*PreferedView*255;
			blueColor <- 1/2*PreferedDancers*255+1/4*PreferedDecor*255+1/4*PreferedView*255;
			myColor <- rgb(redColor,greenColor,blueColor);
			if(redColor>(greenColor+blueColor)*0.55){
				red<-true;
			}
			if(greenColor>(redColor+blueColor)*0.55){
				green<-true;
			}
			if(blueColor>(greenColor+redColor)*0.55){
				blue<-true;
			}
			if(red){
				if(blue){
					if(green){
						colorCode <-6; //neutral
					}else{
						colorCode <-5;//bluered
					}
				}else if (green){
					colorCode <-3;//redgreen
				}else{
					colorCode <-0;//red
				}
			}else if(green){
				if(blue){
					colorCode<-4;//greenblue
				}else{
					colorCode<-1;//green
				}
			}else if(blue){
				colorCode<-2;//blue
			}else{
				colorCode<-6;//neutral
			}
			write name+": my color: ["+redColor+"||"+greenColor+"||"+blueColor+"]";
			write name+": my colors: "+red+","+green+","+blue;
			write name+": my colorCode: "+colorCode;
			type <- "guest";
			happiness <-0.0;
			sick <- false;
			infectivity <- 0.0;
			curability <- 0.0;
			sickness <- 0.0;
		}
		create FestivalGuest number:AmountOfSicks{
			location <- any_location_in(circle(20,{50,50}));
			begin<-true;
			hunger <- 330.0 + rnd(500.0);
			thirst <- 370.0 + rnd(700.0);
			hungry <- false;
			thirsty <- false;
			PreferedSoundQuality <- rnd(10)/10;
			PreferedLightShow <- rnd(10)/10;
			PreferedArtist <- rnd(10)/10;
			PreferedDecor <- rnd(10)/10;
			PreferedDancers <-rnd (10)/10;
			PreferedView <- rnd(10)/10;
			redColor <- 1/2*PreferedSoundQuality*255+1/4*PreferedLightShow*255+1/4*PreferedDecor*255;
			greenColor <- 1/2*PreferedArtist*255+1/4*PreferedLightShow*255+1/4*PreferedView*255;
			blueColor <- 1/2*PreferedDancers*255+1/4*PreferedDecor*255+1/4*PreferedView*255;
			myColor <- rgb(redColor,greenColor,blueColor);
			if(redColor>(greenColor+blueColor)*0.55){
				red<-true;
			}
			if(greenColor>(redColor+blueColor)*0.55){
				green<-true;
			}
			if(blueColor>(greenColor+redColor)*0.55){
				blue<-true;
			}
			if(red){
				if(blue){
					if(green){
						colorCode <-6; //neutral
					}else{
						colorCode <-5;//bluered
					}
				}else if (green){
					colorCode <-3;//redgreen
				}else{
					colorCode <-0;//red
				}
			}else if(green){
				if(blue){
					colorCode<-4;//greenblue
				}else{
					colorCode<-1;//green
				}
			}else if(blue){
				colorCode<-2;//blue
			}else{
				colorCode<-6;//neutral
			}
			write name+": my color: ["+redColor+"||"+greenColor+"||"+blueColor+"]";
			write name+": my colors: "+red+","+green+","+blue;
			write name+": my colorCode: "+colorCode;
			type <- "guest";
			happiness <-0.0;
			sick <- true;
			infectivity <- rnd(100.0);
			curability <- rnd(100.0);
			sickness <- rnd(10.0);
		}
		create FestivalGuest number:AmountOfStars{
			location <- any_location_in(circle(20,{50,50}));
			begin<-true;
			hunger <- 330.0 + rnd(500.0);
			thirst <- 370.0 + rnd(700.0);
			hungry <- false;
			thirsty <- false;
			PreferedSoundQuality <- rnd(10)/10;
			PreferedLightShow <- rnd(10)/10;
			PreferedArtist <- rnd(10)/10;
			PreferedDecor <- rnd(10)/10;
			PreferedDancers <-rnd (10)/10;
			PreferedView <- rnd(10)/10;
			redColor <- 1/2*PreferedSoundQuality*255+1/4*PreferedLightShow*255+1/4*PreferedDecor*255;
			greenColor <- 1/2*PreferedArtist*255+1/4*PreferedLightShow*255+1/4*PreferedView*255;
			blueColor <- 1/2*PreferedDancers*255+1/4*PreferedDecor*255+1/4*PreferedView*255;
			myColor <- rgb(redColor,greenColor,blueColor);
			if(redColor>(greenColor+blueColor)*0.55){
				red<-true;
			}
			if(greenColor>(redColor+blueColor)*0.55){
				green<-true;
			}
			if(blueColor>(greenColor+redColor)*0.55){
				blue<-true;
			}
			if(red){
				if(blue){
					if(green){
						colorCode <-6; //neutral
					}else{
						colorCode <-5;//bluered
					}
				}else if (green){
					colorCode <-3;//redgreen
				}else{
					colorCode <-0;//red
				}
			}else if(green){
				if(blue){
					colorCode<-4;//greenblue
				}else{
					colorCode<-1;//green
				}
			}else if(blue){
				colorCode<-2;//blue
			}else{
				colorCode<-6;//neutral
			}
			write name+": my color: ["+redColor+"||"+greenColor+"||"+blueColor+"]";
			write name+": my colors: "+red+","+green+","+blue;
			write name+": my colorCode: "+colorCode;
			type <- "star";
			happiness <- 0.0;
			sick <- false;
			infectivity <- 0.0;
			curability <- 0.0;
			sickness <- 0.0;
			socialBattery <- 400.0;
			ego <- rnd(20.0);
			egoIncrease <- rnd(3.0);
		}
		create FestivalGuest number:AmountOfDoctors{
			location <- any_location_in(circle(20,{50,50}));
			begin<-true;
			hunger <- 330.0 + rnd(500.0);
			thirst <- 370.0 + rnd(700.0);
			hungry <- false;
			thirsty <- false;
			PreferedSoundQuality <- rnd(10)/10;
			PreferedLightShow <- rnd(10)/10;
			PreferedArtist <- rnd(10)/10;
			PreferedDecor <- rnd(10)/10;
			PreferedDancers <-rnd (10)/10;
			PreferedView <- rnd(10)/10;
			redColor <- 1/2*PreferedSoundQuality*255+1/4*PreferedLightShow*255+1/4*PreferedDecor*255;
			greenColor <- 1/2*PreferedArtist*255+1/4*PreferedLightShow*255+1/4*PreferedView*255;
			blueColor <- 1/2*PreferedDancers*255+1/4*PreferedDecor*255+1/4*PreferedView*255;
			myColor <- rgb(redColor,greenColor,blueColor);
			if(redColor>(greenColor+blueColor)*0.55){
				red<-true;
			}
			if(greenColor>(redColor+blueColor)*0.55){
				green<-true;
			}
			if(blueColor>(greenColor+redColor)*0.55){
				blue<-true;
			}
			if(red){
				if(blue){
					if(green){
						colorCode <-6; //neutral
					}else{
						colorCode <-5;//bluered
					}
				}else if (green){
					colorCode <-3;//redgreen
				}else{
					colorCode <-0;//red
				}
			}else if(green){
				if(blue){
					colorCode<-4;//greenblue
				}else{
					colorCode<-1;//green
				}
			}else if(blue){
				colorCode<-2;//blue
			}else{
				colorCode<-6;//neutral
			}
			write name+": my color: ["+redColor+"||"+greenColor+"||"+blueColor+"]";
			write name+": my colors: "+red+","+green+","+blue;
			write name+": my colorCode: "+colorCode;
			type <- "doctor";
			happiness <-0.0;
			sick <- false;
			infectivity <- 0.0;
			curability <- 0.0;
			sickness <- 0.0;
			intelligence <- rnd(100.0)/100;
			empathy <- rnd(100.0)/100;
			experience <- rnd(10.0)/100;
		}
		create FestivalGuest number:AmountOfJournalists{
			location <- any_location_in(circle(20,{50,50}));
			begin<-true;
			hunger <- 330.0 + rnd(500.0);
			thirst <- 370.0 + rnd(700.0);
			hungry <- false;
			thirsty <- false;
			PreferedSoundQuality <- rnd(10)/10;
			PreferedLightShow <- rnd(10)/10;
			PreferedArtist <- rnd(10)/10;
			PreferedDecor <- rnd(10)/10;
			PreferedDancers <-rnd (10)/10;
			PreferedView <- rnd(10)/10;
			redColor <- 1/2*PreferedSoundQuality*255+1/4*PreferedLightShow*255+1/4*PreferedDecor*255;
			greenColor <- 1/2*PreferedArtist*255+1/4*PreferedLightShow*255+1/4*PreferedView*255;
			blueColor <- 1/2*PreferedDancers*255+1/4*PreferedDecor*255+1/4*PreferedView*255;
			myColor <- rgb(redColor,greenColor,blueColor);
			if(redColor>(greenColor+blueColor)*0.55){
				red<-true;
			}
			if(greenColor>(redColor+blueColor)*0.55){
				green<-true;
			}
			if(blueColor>(greenColor+redColor)*0.55){
				blue<-true;
			}
			if(red){
				if(blue){
					if(green){
						colorCode <-6; //neutral
					}else{
						colorCode <-5;//bluered
					}
				}else if (green){
					colorCode <-3;//redgreen
				}else{
					colorCode <-0;//red
				}
			}else if(green){
				if(blue){
					colorCode<-4;//greenblue
				}else{
					colorCode<-1;//green
				}
			}else if(blue){
				colorCode<-2;//blue
			}else{
				colorCode<-6;//neutral
			}
			write name+": my color: ["+redColor+"||"+greenColor+"||"+blueColor+"]";
			write name+": my colors: "+red+","+green+","+blue;
			write name+": my colorCode: "+colorCode;
			type <- "journalist";
			happiness <-0.0;
			sick <- false;
			infectivity <- 0.0;
			curability <- 0.0;
			sickness <- 0.0;
			respect <- rnd(100.0);
			jobScore <- 0.0;
			hasStory <- false;
			//write name+ " has respect: "+respect;
		}
		create Researcher number:AmountOfResearchers{
			//location <- any_location_in(circle(20,{50,50}));
			stagee<-bool(rr>=2)? {50, 10+80*(rr mod 2)}:{10 + 80*(rr mod 2), 50};
			location<-stagee;
			brains <- (7+rnd(3.0))/10;
			view <- 8+rnd(4.0);
			hasPhone <-flip(0.5)?true:false;
			rr <- rr+1;
		}
		
		create Stage number:AmountOfStages{
			location <-bool(mm>=2)? {50, 10+80*(mm mod 2)}:{10 + 80*(mm mod 2), 50};
			soundQuality <- rnd(10)/10;
			lightShow <- rnd(10)/10;
			artist <- rnd(10)/10;
			decor <- rnd(10)/10;
			dancers <-rnd (10)/10;
			view <- rnd(10)/10;
			myColor <- rgb(1/2*soundQuality*255+1/4*lightShow*255+1/4*decor*255,1/2*artist*255+1/4*lightShow*255+1/4*view*255,1/2*dancers*255+1/4*decor*255+1/4*view*255);
			//size <- 3+(soundQuality+lightShow+artist+decor+dancers+view)*1.5;
			mm <- mm + 1;
		}
		
		create Restaurant{
			HungerRestore <- 4;
			location <- {90,10};
		}
		create Hospital{
			location <- {10,10};
		}
		create Bar{
			ThirstRestore <- 14;
			location <- {10,90};
		}
		create ResearchCenter{
			location<-{90,90};
		}
	}
	
	int AmountSick <- AmountOfSicks update: FestivalGuest count (each.sick);
	int AmountHealthy <- AmountOfSicks update: (AmountOfGuests+AmountOfDoctors+AmountOfSicks+AmountOfStars)-AmountSick;
	float sickRate update: AmountSick/(AmountOfGuests+AmountOfDoctors+AmountOfSicks+AmountOfStars);
	
	float plotHappiness <- 0;
	float plotRed;
	float plotGreen;
	float plotBlue;
	float plotRedgreen;
	float plotGreenblue;
	float plotBluered;
	float plotNeutral;
	reflex update{
		ask FestivalGuest{
			if name="FestivalGuest0"{
				myself.plotHappiness <- happiness;
				myself.plotRed <- colorScores[0];
				myself.plotGreen <- colorScores[1];
				myself.plotBlue <- colorScores[2];
				myself.plotRedgreen <- colorScores[3];
				myself.plotGreenblue <- colorScores[4];
				myself.plotBluered <- colorScores[5];
				myself.plotNeutral <- colorScores[6];
			}
		}
	}	
	
	//predicates for Researcher
	predicate enjoy_festival <- new_predicate("enjoy_festival");
	predicate cure_is_needed <- new_predicate("cure_is_needed");
	predicate work_in_lab <- new_predicate("work_in_lab");
	predicate deliver_cure <- new_predicate("deliver cure");
	predicate cure_delivered <- new_predicate("cure_delivered");
}

species Researcher skills: [moving,fipa] control:simple_bdi{
	point target;
	point stagee;
	string DoctorName <-"test";
	bool goingToResearch;
	
	//scientist specific attributes (acts like normal person but can invent cure to help doctors cure sick people)
	//starts researching a cure that can help doctors save patients
	float view;
	float brains;
	bool hasPhone;
	
	init{
		do add_desire(enjoy_festival);
	}
	
	perceive target:FestivalGuest where (each.type="doctor" and each.lookingForResearcher=true) in:view{
		myself.DoctorName <- name;
		ask myself{
			do add_belief(cure_is_needed,2.0);
			do remove_intention(enjoy_festival,false);
		}
	}
	
	rule belief: cure_is_needed new_desire: work_in_lab strength: 3.0;
	rule belief: work_in_lab new_desire: deliver_cure strength: 4.0;
	rule belief: cure_delivered new_desire: enjoy_festival strength: 5.0;
	
	
	plan lets_wander intention: enjoy_festival{
		do goto target:any_location_in(circle(5,stagee));
	}
	
	plan go_to_lab intention:work_in_lab{
		//write "going to lab";
		target <- {90,90};
		do goto target:target;
		if(target=location){
			//write "here";
			if(flip(brains)){
				do add_belief(work_in_lab);//cure done
			}else{
				do add_belief(cure_delivered);//making cure failed, go back to enjoying festival
			}			
		}
	}
	
	plan bring_cure intention:deliver_cure{
		if(hasPhone){
			do start_conversation with: [to :: list(FestivalGuest),protocol::'no-protocol',performative::'inform',contents::[DoctorName]];
		}else{
			do goto target:{10,10};
			if (location={10,10}){
				ask Hospital{
					if !(cures contains myself.DoctorName){
						add myself.DoctorName to: cures;
					}
				}
			}
		}
		do add_belief(cure_delivered);
	}
	
	
	aspect default{
		draw sphere(1) at:location color:#black;
		draw cone3D(1.1,2.3) at: {location.x,location.y,location.z+1} color:#blue;
	}
	
}

species FestivalGuest skills:[fipa,moving]{
	rgb myColor;
	bool begin;
	float PreferedSoundQuality;
	float PreferedLightShow;
	float PreferedArtist;
	float PreferedDecor;
	float PreferedDancers;
	float PreferedView;
	list<float> stageScores;
	point target;
	float hunger;
	float thirst;
	bool hungry;
	bool thirsty;
	string type;
	float happiness;
	int cureTime;
	int colorCode; //0=red,1=green,2=blue,3=redgreen,4=greenblue,5=bluered,6=neutral
	float redColor;
	float greenColor;
	float blueColor;
	bool red <- false;
	bool green <- false;
	bool blue <- false;
	list<float> colorScores <- [0.8,0.8,0.8,0.8,0.8,0.8,0.8];//80% initial chance to interact with each type
	
	int busy <-50;
	bool goingToHospital<-false;
	bool lookingForResearcher <-false;
	bool goingToResearch <-false;
	
	agent followPerson;
	
	
	//sick person specific attributes (acts like normal person but can get people sick. can be cured by doctors)
	bool sick; //determines wether healthy or not
	float infectivity; //determines chance to infect others 
	float sickness; //die if too sick
	float curability; //determines chance to cure
	
	//star specific attributes (special person, people want to talk to, people sad if dies)
	float socialBattery; //decides how long can interact before tired
	bool openToConversation <- true; //decides if want to interact or not
	float ego; //determines interaction, increases if a lot of people talk with him
	float egoIncrease; //determines how much ego increases after interaction
	
	//doctor specific attributes (acts like normal person, but can cure sick people if willing/capable
	float intelligence; //determines chance to cure
	float empathy; //determines chance to help
	float experience; //base chance + increases when attempted to help
	
	//journalist specific attributes
	float jobScore;//score for how well job performed
	bool hasStory;
	float respect;// determines chance star wants to interact
	int storyTold<-0;
	
	
	bool hasCure;
	

	
	
	reflex getStageInfo when:begin
	{
		do start_conversation with: [to :: list(Stage), protocol :: 'no-protocol',performative :: 'request',contents ::['getStageInfo']];
		begin<-false;
	}
	
	reflex receiveCure when: !empty(informs)
	{
		list cures <- informs;
		if length(cures) = AmountOfGuests{
			loop c over:cures{
				//write "content: "+c.contents;
				if c.contents = name{
					hasCure <- true;
				}
			}
		}
	}
	
	reflex receiveStageInfo when: !empty(requests)
	{
		stageScores <-[];
		if hungry=false and thirsty=false{
			target <- nil;
		}
		list<point> stageLocations;
		
		list info <- requests;
		if length(info) =  AmountOfStages{
			loop i over:info{
				add(i.contents[0]) to:stageLocations;
				
				float score <- PreferedSoundQuality*float(i.contents[1]) + PreferedLightShow*float(i.contents[2])+PreferedArtist*float(i.contents[3])+PreferedDecor*float(i.contents[4])+PreferedDancers*float(i.contents[5])+PreferedView*float(i.contents[6]);
				add score to:stageScores;
			}
			
			//write name + ': stageScores are: '+stageScores;
			//write name + ': for stages at: '+stageLocations;
			if hungry=false and thirsty=false and !goingToHospital{
				int indexOfBestStage <- stageScores index_of((max(stageScores)));
				target <- stageLocations[indexOfBestStage];
				//write name + ": I'm going to the stage at location: "+target;
				//write '------------------------------------';
			}
			
			loop i over:info{
				do end_conversation with:[message :: i, contents :: ['Info received and processed.']];
			}
		}	
	}
	
	reflex goToStage when:target != nil and hungry = false and thirsty = false and goingToHospital = false
	{
		if hunger>0{
			hunger <- hunger - rnd(2.0);
		}
		if thirst>0{
			thirst <- thirst - rnd(2.0);
		}
		if(type="star"){
			socialBattery <- socialBattery + 3.0;
		}
		do goto target:any_location_in(circle(20,target)) speed:3.0;
	}
	
	reflex goToPlace when:target != nil and (hungry=true or thirsty=true or goingToHospital = true)
	{
		do goto target:target speed:3.0;
	}
	reflex goRestaurant when: hunger < 3 and hungry = false and goingToHospital = false
	{
		target <- any_location_in(circle(5,{90,10}));
		hungry <- true;
	}
	
	reflex goBar when: thirst < 3 and thirsty = false and goingToHospital = false
	{
		target <- any_location_in(circle(4,{10,90}));
		thirsty <- true;
	}
	
	//star specific reflexes
	reflex Open when: type="star" and socialBattery>200.0
	{
		openToConversation <-true;
	}
	
	reflex Close when: type="star" and socialBattery<0.0
	{
		openToConversation <- false;
	}
	
	//sick reflexes
	reflex death when:sickness>100.0
	{
		write name+" has died of illness.";
		do die;
	}
	
	reflex getWorse when: sick{
		sickness <- sickness + rnd(1.0)/100;
	}
	
	//doctor reflexes
	reflex Treatment when:goingToHospital and (location={10,10})
	{
		cureTime <- cureTime +1;
		//write "curetime: "+cureTime;
	}
	
	reflex gettingReady when: type="doctor"
	{
		busy <-busy+1;
	}
	
	//backup
	reflex backup when:cureTime>65{
		goingToHospital <-false;
		target <- nil;
		cureTime <-0;
	}
	
	//journalist reflex
	reflex storyDone when:storyTold>5{
		hasStory<-false;
	}
	
	aspect default{
		draw sphere(1) at:location color:myColor;
		if(type="star"){
			draw cone3D(1.1,2.3) at: {location.x,location.y,location.z+1} color:#yellow;
		}
		if(type="doctor"){
			draw cone3D(1.1,2.3) at: {location.x,location.y,location.z+1} color:#red;
		}
		if(type="journalist"){
			draw cone3D(1.1,2.3) at: {location.x,location.y,location.z+1} color:#purple;
		}
		if(sick){
			draw circle(1.4) at: location color: #green;
		}
		
		
		if(hungry){
			ask Restaurant at_distance(7){
				myself.hunger <- myself.hunger+HungerRestore;
				if(myself.hunger > (400+rnd(200))){
					myself.hungry<-false;
				}
			}
		}
		
		if(thirsty){
			ask Bar at_distance(6){
				myself.thirst <- myself.thirst+ThirstRestore;
				if(myself.thirst > (450+rnd(250))){
					myself.thirsty<-false;
				}
			}
		}
		
		if(goingToHospital and !(type="doctor")){
			ask followPerson{
				myself.target<-location;
			}
		}
		
		if(goingToHospital and cureTime>50 and !(type="doctor")){
			ask followPerson{
				if(myself.curability>50){//if curability is higher than 50 the disease is too hard to cure without a cure from a researcher
					if(hasCure){
						myself.sick <- false;
						//write myself.name+" has been cured by "+name+" using a cure!";
						myself.sickness <- 0.0;
						myself.curability <- 0.0;
						myself.infectivity <- 0.0;
						experience <- experience + 0.1;
						hasCure <-false;
					}else{
						//write "patient: "+myself.name+" too sick to cure, need new research.";
						lookingForResearcher<-true;
						busy <-0;
					}	
				}else{
					if(flip(intelligence+experience)){//here is decided if curing is succesfull
						myself.sick <- false;
						//write myself.name+" has been cured by "+name+"!";
						myself.sickness <- 0.0;
						myself.curability <- 0.0;
						myself.infectivity <- 0.0;
						experience <- experience + 0.1;
					}else{
						busy <-0;
						experience <- experience +0.05;
						//write name+" was unable to cure "+myself.name+".";
					}
					
				}
				myself.goingToHospital <-false;
				myself.target <- nil;
				goingToHospital <- false;
				target <-nil;
				cureTime <-0;
				myself.cureTime<-0;
			}
		}
		
		if(lookingForResearcher){//doctor meets researcher that can develop a cure
			ask Researcher at_distance(2){
				if(!goingToResearch){
					//write name+" will try to develop a cure for "+myself.name;
						DoctorName<-myself.name;
						myself.lookingForResearcher<-false;
				}
			}
		}
		
		ask FestivalGuest at_distance(2){
			if(sick){
				if(myself.type="doctor" and myself.busy>50){//here is a chance for the doctor to take a sick person to the hospital for a chance to cure them
					if(!goingToHospital){
						if(flip(myself.empathy)){
							//write myself.name+" will try to cure "+name;
							myself.goingToHospital<-true;
							goingToHospital<-true;
							myself.target <- {10,10};
							followPerson <- myself;
						}
					}
				}else{
					if(!(myself.sick or myself.type="doctor")){//here is where people can get sick
						if(flip(infectivity/10000)){
							myself.sick<-true;
							myself.sickness<-0.0;
							myself.curability<-rnd(100.0);
							myself.infectivity<-rnd(100.0);
							//write myself.name + ": got sick.";
						}
					}
				}
			}
			if(myself.type="guest"){
				if(type="guest"){// Reinforcement learning on deciding wether or not to interact with a different guest based on the color of their sphere, which is dependant on their attributes and can predict wether the interaction will be positve or negative.
					if(flip(myself.colorScores[colorCode])){
						//write "interaction happened: chance to interact: "+myself.colorScores[colorCode];
						float difference <- abs(myself.PreferedSoundQuality-PreferedSoundQuality)+abs(myself.PreferedLightShow-PreferedLightShow)+abs(myself.PreferedArtist-PreferedArtist)+abs(myself.PreferedDecor-PreferedDecor)+abs(myself.PreferedDancers-PreferedDancers)+abs(myself.PreferedView-PreferedView);
						//write "difference: "+difference;
						//write "happiness before: "+happiness;
						if(2.0 - difference>0){//2.0 because it is the mean of the difference
							//write name+' and '+myself.name+' had a positive interaction!';
							happiness <- happiness + 3.0;
							float reward <- max([min([(2.0-difference)/2,1]),0]);//a positive reward between 0 and 1
							float newColorScore <- myself.colorScores[colorCode] + alpha*reward*(1-myself.colorScores[colorCode]);//new chance to interact
							//write "Old score: "+myself.colorScores[colorCode]+", new score: "+newColorScore;
							put newColorScore at:colorCode in:myself.colorScores;
						}else{
							//write name+' and '+myself.name+' had a negative interaction!';
							happiness <- happiness - 5.0;
							float reward <- max([min([-(2.0-difference)/2,1]),0]);//a positive reward between 0 and 1
							float newNoChance <- (1-myself.colorScores[colorCode]) + alpha*reward*myself.colorScores[colorCode];//new chance not to interact
							float newColorScore <- 1-newNoChance;
							//write "Old score: "+myself.colorScores[colorCode]+", new score: "+newColorScore;
							put newColorScore at:colorCode in:myself.colorScores;
						}
						//write "happiness after: "+happiness;
					}
				}
				
				if(type="star"){
					/*if(myself.name="FestivalGuest22"){
						write "before:";
						write myself.name+": happiness: "+myself.happiness;
						write "celeb name: " + name;
						write name + ": happiness: "+ happiness;
						write name + ": social: "+ socialBattery;
					}
					*/
					
					if openToConversation and (rnd(100.0)-ego>10.0){//star interacts but gets tired
						//myself.happiness <- myself.happiness + 5.0;
						happiness <- happiness + 1.0;
						socialBattery <- socialBattery - 3.0;
						ego <- ego + egoIncrease;
					}else{//star doesnt want to interact
						//myself.happiness <- myself.happiness - 6.0;
						happiness <- happiness - 2.5;
					}
					/*
					if(myself.name="FestivalGuest22"){
						write "after:";
						write myself.name+": happiness: "+myself.happiness;
						write "celeb name: " + name;
						write name + ": happiness: "+ happiness;
						write name + ": social: "+ socialBattery;
						write "=============================";
					}
					*/
				}
			}
			if(myself.type="journalist"){
				if(type="star"){
					if(myself.hasStory=false){//journalists tries to interview star to get a story
						//write "test";
						if openToConversation and (rnd(100.0)-ego>10.0){
							//write "test2";
							if(location = any_location_in(circle(4,{90,10})) or location = any_location_in(circle(4,{10,90}))){
								if(flip((myself.respect+myself.jobScore-70)/100)){
									//write "acquiered story";
									socialBattery <- socialBattery - 8.0;
									ego <- ego + egoIncrease*2;
									myself.hasStory <-true;
									myself.jobScore <- myself.jobScore+10.0;
								}else{
									myself.jobScore <- myself.jobScore-2.0;
								}
							}else{
								//write "test3";
								if(flip((myself.respect+myself.jobScore-50)/100)){
									//write "acquiered story";
									socialBattery <- socialBattery - 8.0;
									ego <- ego + egoIncrease*2;
									myself.hasStory <-true;
									myself.jobScore <- myself.jobScore+5.0;
								}else{
									myself.jobScore <- myself.jobScore-2.0;
								}
							}
						}
					}
				}
				if(type="guest"){//journalist sells story to guests
					if(myself.hasStory=true){
						//write "story told";
						myself.storyTold <- myself.storyTold + 1;
						myself.jobScore <- myself.jobScore + 1;
					}
				}
			}
		}
		
	}
}


species Stage skills: [fipa]{
	float soundQuality;
	float lightShow;
	float artist;
	float decor;
	float dancers;
	float view;
	rgb myColor;
	
	reflex sendStageInfo when: !empty(requests)
	{
		loop r over: requests{
			if r.contents = ['getStageInfo']{
				do request with:[message :: r,contents::[self.location,soundQuality,lightShow,artist,decor,dancers,view]];
			}
		}
	}
	
	reflex newAct when: time mod 75.0 = 0.0
	{
		soundQuality <- rnd(10)/10;
		lightShow <- rnd(10)/10;
		artist <- rnd(10)/10;
		decor <- rnd(10)/10;
		dancers <-rnd (10)/10;
		view <- rnd(10)/10;
		myColor <- rgb(1/2*soundQuality*255+1/4*lightShow*255+1/4*decor*255,1/2*artist*255+1/4*lightShow*255+1/4*view*255,1/2*dancers*255+1/4*decor*255+1/4*view*255);
		
		do start_conversation with:[to::list(FestivalGuest), protocol :: 'no-protocol', performative :: 'request',contents ::[self.location,soundQuality,lightShow,artist,decor,dancers,view]];
	}
	
	aspect default{
		draw pyramid(16) at:{location.x,location.y,location.z+10} color:myColor;
		draw cylinder(1,10) at:{location.x+7,location.y+7,location.z} color:myColor;
		draw cylinder(1,10) at:{location.x-7,location.y+7,location.z} color:myColor;
		draw cylinder(1,10) at:{location.x+7,location.y-7,location.z} color:myColor;
		draw cylinder(1,10) at:{location.x-7,location.y-7,location.z} color:myColor;
		if location = {90,50,0}{
			draw box(5,10,2) at:{94,50,0} color:myColor;
		}else if location = {50,10,0}{
			draw box(10,5,2) at:{50,6,0} color:myColor;
		}else if location = {50,90,0}{
			draw box(10,5,2) at:{50,94,0} color:myColor;
		}else if location = {10,50,0}{
			draw box(5,10,2) at:{6,50,0} color:myColor;
		}
	}
}

species Restaurant
{
	int HungerRestore;
	aspect default{
		draw cylinder(1,8) at: {location.x,location.y,location.z} color: #yellow;
		draw cylinder(6,1) at: {location.x,location.y,location.z+8} color: #yellow;
		draw cone3D(7,5) at:{location.x,location.y,location.z+8} color:#blue;
		draw square(12) at:location color:#yellow;
		draw box(12,1,4) at: {location.x,location.y-5.5,location.z} color:#blue;
		draw box(1,12,4) at: {location.x+5.5,location.y,location.z} color:#blue;
	}
}

species Bar
{
	int ThirstRestore;
	aspect default{
		draw cylinder(1,8) at: {location.x,location.y,location.z} color: #blue;
		draw cylinder(6,1) at: {location.x,location.y,location.z+8} color: #blue;
		draw cone3D(7,5) at:{location.x,location.y,location.z+8} color:#yellow;
		draw square(12) at:location color:#blue;
		draw box(12,1,4) at: {location.x,location.y+5.5,location.z} color:#yellow;
		draw box(1,12,4) at: {location.x-5.5,location.y,location.z} color:#yellow;
	}
}

species Hospital
{
	list<string> cures;
	
	aspect default{
		draw box(12,12,3) at: {location.x,location.y,location.z+8} color:#red;
		draw pyramid(13) at:{location.x,location.y,location.z+8} color:#white;
		draw box(1,1,8) at: {location.x+5.5,location.y+5.5,location.z} color:#black;
		draw box(1,1,8) at: {location.x-5.5,location.y+5.5,location.z} color:#black;
		draw box(1,1,8) at: {location.x+5.5,location.y-5.5,location.z} color:#black;
		draw box(1,1,8) at: {location.x-5.5,location.y-5.5,location.z} color:#black;
		draw square(12) at:location color:#red;
		draw box(12,1,6) at: {location.x,location.y-5.5,location.z} color:#slategrey;
		draw box(1,12,6) at: {location.x-5.5,location.y,location.z} color:#slategrey;
		draw box(4,0.5,5) at: {location.x,location.y,location.z+20} color:#white;
		draw box(1,1,5) at: {location.x,location.y,location.z+20} color:#red;
		draw box(4,1,1) at: {location.x,location.y,location.z+22} color:#red;
		
		ask FestivalGuest(2){
			if(type="doctor"){
				if myself.cures contains name{
					remove name from: myself.cures;
					hasCure <- true;
				}
			}
		}
	}
}

species ResearchCenter
{
	aspect default{
		draw box (12,12,9) at: {location.x,location.y,location.z+3} color: #slategrey;
		draw box(13,13,2) at: {location.x,location.y,location.z+9} color:#white;
	}
}

experiment main type: gui{
	
	output	{
		//monitor "fraction of people that are sick" value: sickRate;
		
		display map type: opengl {
			species FestivalGuest;
			species Stage;
			species Restaurant;
			species Bar;
			species Hospital;
			species ResearchCenter;
			species Researcher;			
		}
		 
		/*display chart3 refresh: every(2 #cycles) {
			chart "evolution of sickness in population" type: series style: spline {
				data "healthy people" value: AmountHealthy color: #green marker: false;
				data "sick people" value: AmountSick color: #red marker: false;
			}
		}*/
		
		display chart refresh: every(2 #cycles){
			chart "happiness of FestivalGuest0" type: series style: spline{
				data "happiness" value: plotHappiness color: #black marker:false;
			}
		}
		display chart2 refresh: every(2 #cycles){
			chart "interaction chances of FestivalGuest0" type: series style: spline{
				data "red" value:plotRed color: #red marker:false;
				data "green" value:plotGreen color: #green marker:false;
				data "blue" value:plotBlue color: #blue marker:false;
				data "redgreen" value:plotRedgreen color: #brown marker:false;
				data "greenblue" value:plotGreenblue color: #cyan marker:false;
				data "bluered" value:plotBluered color: #purple marker:false;
				data "neutral" value:plotNeutral color: #grey marker:false;
			}
		}
	}
}	




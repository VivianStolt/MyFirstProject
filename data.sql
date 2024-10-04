SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';
SET @old_autocommit=@@autocommit;

USE supports;

INSERT INTO `genders` (`gender`) VALUES ('Mies');
INSERT INTO `genders` (`gender`) VALUES ('Nainen');
INSERT INTO `genders` (`gender`) VALUES ('Ei-binäärinen');

INSERT INTO `activity_levels` (`activity_level`, `description`, `activity_factor`) VALUES 
('Istuva', 'Tämä tarkoittaa hyvin vähäistä liikkumista tai liikuntaa. Päivittäinen toiminta rajoittuu lähinnä istumatyöhön tai muihin pieniin, vähäistä liikuntaa vaativiin aktiviteetteihin.', 1.2),
('Kevyesti aktiivinen', 'Kevyttä liikuntaa tai urheilua 1-3 päivänä viikossa. Tämä voi sisältää esimerkiksi kävelylenkkejä, kevyttä kotityötä tai muita ei-rasittavia liikuntamuotoja.', 1.375),
('Kohtalaisen aktiivinen', 'Kohtalaista liikuntaa tai urheilua 3-5 päivänä viikossa, kuten säännöllisiä salitreenejä, pyöräilyä tai juoksua.', 1.55),
('Hyvin aktiivinen', 'Rasittavaa liikuntaa tai urheilua 6-7 päivänä viikossa. Tämä voi sisältää intensiivisiä päivittäisiä treenejä tai fyysisesti vaativan työn, kuten rakennustyön.', 1.725),
('Erittäin aktiivinen', 'Erittäin rasittavaa liikuntaa tai työtä, kuten kahdet päivittäiset harjoitukset tai fyysisesti erittäin vaativa ammatti (esim. ammattiurheilijat tai rakennustyöläiset, jotka nostavat raskaita taakkoja päivittäin).', 1.9);

INSERT INTO `fitness_goals` (`fitness_goal`) VALUES ('Kehonrakennus');
INSERT INTO `fitness_goals` (`fitness_goal`) VALUES ('Tekniikkaharjoittelua');
INSERT INTO `fitness_goals` (`fitness_goal`) VALUES ('Voimaharjoittelu');
INSERT INTO `fitness_goals` (`fitness_goal`) VALUES ('Laihduttaminen');
INSERT INTO `fitness_goals` (`fitness_goal`) VALUES ('Kuntoutumisen jälkeen');

INSERT INTO `other_health_trackers` (`tracker_name`) VALUES ('Veden juonti');
INSERT INTO `other_health_trackers` (`tracker_name`) VALUES ('Kuukautisten seuranta');
INSERT INTO `other_health_trackers` (`tracker_name`) VALUES ('Unen seuranta');
INSERT INTO `other_health_trackers` (`tracker_name`) VALUES ('Streakkien seuranta');
INSERT INTO `other_health_trackers` (`tracker_name`) VALUES ('Kehon mitat');
INSERT INTO `other_health_trackers` (`tracker_name`) VALUES ('Elintoiminnot');

USE supports;

INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Aerobics', 6.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Aikido', 10.3);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Archery', 4.3);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Badminton', 5.75);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Ballet', 5.5);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Baseball', 5.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Basketball', 7.25);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Bowling', 3.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Boxing', 12.8);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Capoeira', 7.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Canoeing (Moderate Effort)', 7.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Cricket', 5.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Cross-Country Skiing', 9.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('CrossFit', 8.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Curling', 4.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Cycling (General)', 10.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Dance (General)', 6.5);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Darts', 2.5);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Disc Golf (Frisbee Golf)', 3.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Dodgeball', 5.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Dragon Boat Racing', 7.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Equestrian (Horse Riding)', 5.8);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Fencing', 6.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Field Hockey', 7.8);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Fishing (General)', 3.5);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Floorball', 8.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Football (Soccer)', 8.5);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Frisbee Golf', 3.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Futsal', 8.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Gaelic Football', 8.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Golf', 5.15);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Gymnastics', 3.8);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Handball', 8.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Hiking', 6.65);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Ice Hockey', 8.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Ice Skating', 7.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Inline Skating (Rollerblading)', 9.75);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Judo', 10.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Jiu-Jitsu', 10.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Karate', 10.3);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Kayaking', 8.75);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Kickboxing', 10.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Lacrosse', 8.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Martial Arts (General)', 10.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Muay Thai', 10.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Netball', 7.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Nordic Walking', 6.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Orienteering', 9.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Paddleboarding', 4.5);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Padel Tennis', 6.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Pilates', 3.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Racquetball', 8.5);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Roller Derby', 8.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Rowing (Moderate Effort)', 7.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Rugby', 8.3);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Running (General)', 11.5);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Sailing', 3.5);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Skateboarding', 5.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Skiing (Cross-Country)', 9.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Softball', 4.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Squash', 9.65);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Swimming (General)', 8.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Table Tennis (Ping Pong)', 4.5);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Tai Chi', 3.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Tennis', 8.65);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Trampolining', 4.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Ultimate Frisbee', 8.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Volleyball', 5.5);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Wakeboarding', 6.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Water Polo', 10.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Weightlifting', 6.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Windsurfing', 7.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Wrestling', 7.0);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Yoga', 3.25);
INSERT INTO `sports` (`sport_name`, `MET`) VALUES ('Zumba', 5.5);

INSERT INTO `skill_levels` (`skill_level`) VALUES ('Aloittelija');
INSERT INTO `skill_levels` (`skill_level`) VALUES ('Keskitaso');
INSERT INTO `skill_levels` (`skill_level`) VALUES ('Edistynyt');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET autocommit=@old_autocommit;
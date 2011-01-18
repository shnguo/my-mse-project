insert  into `tbl_clinic`(`id`,`name`,`introduction`,`grade`,`address`,`telephone`,`email`,`star`,`management_password`,`status`,`created_date`,`created_by`,`last_modified_date`,`last_modified_by`) values (1,'上海宠物医院','上海宠物医院坐落于上海。',3,'上海市','60000000','service@shcwyy.com',5,'111111','ACTIVE','2011-01-18 00:00:00',1,'2011-01-18 00:00:00',1);

insert  into `tbl_user`(`id`,`username`,`password`,`temp_password`,`email`,`name`,`gender`,`status`,`user_type`,`created_date`,`created_by`,`last_modified_date`,`last_modified_by`) values (1,'admin','111111','222222','admin@petclinic.com','沈备军管理员','FEMALE','ACTIVE',0,'2011-01-18 00:00:00',1,'2011-01-18 00:00:00',1),(2,'vet','111111','222222','vet@petclinic.com','沈备军医生','FEMALE','ACTIVE',1,'2011-01-18 00:00:00',1,'2011-01-18 00:00:00',1),(3,'petowner','111111','222222','petowner@petclinic.com','沈备军宠物主人','FEMALE','ACTIVE',2,'2011-01-18 00:00:00',1,'2011-01-18 00:00:00',1);

insert  into `tbl_administrator`(`id`) values (1);

insert  into `tbl_veterinarian`(`id`,`clinic_id`,`title`,`introduction`,`telephone`,`birthdate`,`workingdate`) values (2,1,'主任','拥有10年宠物医疗经验。','61111111','1970-01-01','1995-01-01');

insert  into `tbl_petowner`(`id`,`id_card`,`birthdate`,`address`,`zipcode`,`telephone`) values (3,'310000198101010000','1981-01-01','上海市','200000','13900000000');
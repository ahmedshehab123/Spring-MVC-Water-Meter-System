package org.maman.services;

import org.maman.model.RegUser;
import org.maman.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Service;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Service
public class UserServices {

	
	@Autowired
	MongoOperations mongoTemplate;
	
	
	public RegUser createUser(RegUser user) {

		mongoTemplate.insert(user);
		return user;
	}
	public Users saveUser(Users user) {

		mongoTemplate.insert(user);
		return user;
	}public void removeUserFromReg(String userID){
		BasicQuery query = new BasicQuery("{id: '"+userID+"'}");
		 mongoTemplate.remove(query, RegUser.class);
		
	}
	public Users login(String email, String password){
		BasicQuery query = new BasicQuery("{email: '"+email+"', password: '"+password+"' }");
		Users user = mongoTemplate.findOne(query, Users.class);
		
		return user;
	}
	
	public boolean checkExistEMail(String email){
		BasicQuery query = new BasicQuery("{email: '"+email+"'}");
		RegUser user = mongoTemplate.findOne(query, RegUser.class);
		if(user==null){
			return true;
		}else{
			return false;
		}
	}
	public boolean checkExistEMailFinal(String email){
		BasicQuery query = new BasicQuery("{email: '"+email+"'}");
		Users user = mongoTemplate.findOne(query, Users.class);
		if(user==null){
			return true;
		}else{
			return false;
		}
	}
	public RegUser firstRegistration(String id){
		BasicQuery query = new BasicQuery("{id: '"+id+"'}");
		RegUser user = mongoTemplate.findOne(query, RegUser.class);
		return user;
		
	}
	
	public void sendEmailToAdmin(  String userID) {

		final String username = "watermetersystem@gmail.com";
		final String password = "mamanmaman";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("ahmedshehab1000@gmail.com"));
			message.setSubject("Event invitation");
			message.setText(
					"Hello i there is new request to be " + "please join us by accessing this link thanks,\n "
							+ "http://localhost:8080/WaterMeterMonitoringSystem/adminconfirm?userID=" + userID + "");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	public void sendEmailTouser(String userEmail) {

		final String username = "eventschedulingsite@gmail.com";
		final String password = "andreaandrea";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
			message.setSubject("Event invitation");
			message.setText(
					"Hello i there is new request to be " + "please join us by accessing this link thanks,\n "
							+ "http://localhost:8080/WaterMeterMonitoringSystem/home");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}

package Dao;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.sound.midi.MidiMessage;

import Entity.Email;


public class EmailDao {
	Connection connection;
	
	
	public EmailDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public int countMessage()
	{
		int total=0;
		try {
			String sql="select count(id) from message";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			total = preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return total;
	}

	public static void sendEmail(Email message) {
		String host = "smtp.gmail.com";
		Properties properties = System.getProperties();
		System.out.println(properties);

		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		Session instance = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication("surajsingh12821@gmail.com","1111" );
			}

		});

		MimeMessage mimeMessage = new MimeMessage(instance);

		try {
			mimeMessage.setFrom(message.getFrom());
			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(message.getTo()));
			mimeMessage.setSubject(message.getSubject());
			mimeMessage.setText(message.getMessage());

			Transport.send(mimeMessage);
			System.out.println("Send SuccessFully");

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void sendAttachment(Email message) {
		String host = "smtp.gmail.com";
		Properties properties = System.getProperties();
		System.out.println(properties);

		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");

		Session instance = Session.getInstance(properties, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication("surajsingh12821@gmail.com", "1111");
			}

		});

		MimeMessage mimeMessage = new MimeMessage(instance);

		try {
			mimeMessage.setFrom(message.getFrom());
			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(message.getTo()));
			mimeMessage.setSubject(message.getSubject());
			mimeMessage.setText(message.getMessage());
			String path = "";
			MimeMultipart mimeMultipart = new MimeMultipart();
			mimeMessage.setContent(mimeMultipart);
			MimeBodyPart bodyPart = new MimeBodyPart();
			File file = new File(path);
			try {
				bodyPart.attachFile(file);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			mimeMultipart.addBodyPart(bodyPart);
			mimeMessage.setContent(mimeMultipart);
			Transport.send(mimeMessage);
			System.out.println("Send SuccessFully");

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

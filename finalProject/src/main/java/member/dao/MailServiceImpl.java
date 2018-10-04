package member.dao;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
	private final JavaMailSender javaMailSender;
	
	@Autowired
	public MailServiceImpl(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	public boolean send(String subject, String text, String from, String to) {
		MimeMessage msg = javaMailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(msg,true,"UTF-8");
			helper.setSubject(subject);
			helper.setText(text,true);
			helper.setFrom(from);
			helper.setTo(to);
			
			javaMailSender.send(msg);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}
	
}

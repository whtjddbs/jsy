package member.dao;

public interface MailService {
	boolean send(String subject, String text, String from, String to);
}


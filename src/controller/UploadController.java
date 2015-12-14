package controller;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.Date;
import java.util.List;
import java.util.Properties;

/**
 * Created by fwarr on 02-Dec-15.
 */
@WebServlet("/upload")
@MultipartConfig(fileSizeThreshold=1024*1024*2,
        maxFileSize=1024*1024*10,
        maxRequestSize=1024*1024*50)
public class UploadController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final String SAVE_DIR = "uploadFiles";

        // gets absolute path of the web application
        String appPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String savePath = appPath + SAVE_DIR;
        String filePath = null;

        // creates the save directory if it does not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
             fileSaveDir.mkdir();
        }
        System.out.println(savePath);
        System.out.println(request.getParts());
        for (Part part : request.getParts()) {
            if(part.getName().equals("file")) {
                String fileName = request.getParameter("dd1")+"."+request.getParameter("dd2")+"."+request.getParameter("name")+"."+extractFileName(part);
                filePath=savePath + File.separator + fileName;
                System.out.println(filePath);
                File file = new File(filePath);

                try (InputStream input = part.getInputStream()) {
                    Files.copy(input, file.toPath());
                }
            }
        }

        System.out.println("Email sending");
        /******************************************************************************************************/
        // Recipient's email ID needs to be mentioned.
        String to = "editorialboardcrce2016@gmail.com";

        // Sender's email ID needs to be mentioned
        String from = "editorialboardcrce2016@gmail.com";

        final String username = "editorialboardcrce2016@gmail.com";//change accordingly
        final String password = "fragmagcrce2016";//change accordingly


        String host = "smtp.gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        // Get the Session object.
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            System.out.println("inside try");
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));

            // Set Subject: header field
            message.setSubject("[Article: "+request.getParameter("category")+"]");

            // Create the message part
            BodyPart messageBodyPart = new MimeBodyPart();

            // Now set the actual message
            messageBodyPart.setText("Name: "+request.getParameter("name")+"\nClass: "+request.getParameter("ddl")+"\nEmail: "+request.getParameter("email")+"\n"+new Date().toString());

            // Create a multipar message
            Multipart multipart = new MimeMultipart();

            // Set text message part
            multipart.addBodyPart(messageBodyPart);

            //System.out.println("Adding parts");
            //for(Part parts : request.getParts()){
            //    multipart.addBodyPart((BodyPart)parts);
            //}
            //Part two is attachment
            messageBodyPart = new MimeBodyPart();
            DataSource source = new FileDataSource(filePath);
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(filePath.substring(filePath.lastIndexOf('\\')+1));
            multipart.addBodyPart(messageBodyPart);

            // Send the complete message parts
            message.setContent(multipart);

            // Send message
            System.out.println("sending message");
            //Transport.send(message);

            System.out.println("Sent message successfully....");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}

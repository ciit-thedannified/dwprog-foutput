package ciit.dwprog.foutput.util;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.sql.*;
import java.util.Arrays;
import java.util.List;

public class Database {

    private static Connection INSTANCE;
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Danne is the only admin.";
    private static final String URL = "jdbc:mysql://localhost:3306/ask_away";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static Connection getInstance() throws SQLException {
        synchronized (Database.class) {
            if (INSTANCE == null || INSTANCE.isClosed())
                INSTANCE = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        }

        return INSTANCE;
    }

    public static Question[] getQuestions(int id) throws SQLException {
        Connection connection = getInstance();

        PreparedStatement ps = connection.prepareStatement("SELECT questions FROM surveys WHERE survey_id = ?");
        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        rs.next();
        String d = rs.getString("questions");

        ps.close();
        rs.close();

        Gson g = new Gson();

        return g.fromJson(d, Question[].class);
    }

    public static String getQuestionsJson(int id) {
        String d = null;
        try {
            Connection connection = getInstance();

            PreparedStatement ps = connection.prepareStatement("SELECT questions FROM surveys WHERE survey_id = ?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            rs.next();
            d = rs.getString("questions");

            ps.close();
            rs.close();

        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
        }

        return d;
    }

    public static Response[] getResponse(int id) throws SQLException {
        Connection connection = getInstance();

        PreparedStatement ps = connection.prepareStatement("SELECT response FROM survey_responses WHERE response_id = ?");
        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        rs.next();
        String d = rs.getString("questions");

        ps.close();
        rs.close();

        Gson g = new Gson();

        return g.fromJson(d, Response[].class);
    }

    public static int updateSurvey(int id, String json) throws SQLException {
        Connection connection = getInstance();

        PreparedStatement ps = connection.prepareStatement("UPDATE surveys SET questions = ? WHERE survey_id = ?");
        ps.setString(1, json);
        ps.setInt(2, id);

        return ps.executeUpdate();
    }

}

import ciit.dwprog.foutput.util.Database;
import ciit.dwprog.foutput.util.Question;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class Testers {


    @Test
    public void gsonTest() throws SQLException {

        Question[] g = Database.getQuestions(7);

        for (Question q : g) {
            System.out.println(q.getPrompt());
            System.out.println(q.getType());
            System.out.println(q.getOptions());
        }

    }

}

/**
 * stringTools
 * Trevor Chen
 * 24/9/25
 */



public class stringTools {
    public String lastLetter(String s) {
        return s.substring(s.length()-1);
    }
    public String formPhone(String s) {
        return "("+s.substring(0, 3)+") "+s.substring(3, 6)+" "+s.substring(6);
    }
    public String midThree(String s) {
        return s.substring(s.length()/2-1, s.length()/2+2);
    }
    public String swapLastTwo(String s) {
        return s.substring(0, s.length()-2)+s.substring(s.length()-1)+s.substring(s.length()-2, s.length()-1);
    }
    public boolean frontAgain(String s, int e) {
        String f = s.substring(0, e);
        String g = s.substring(s.length()-e);
        return (f.compareTo(g) == 0);
    }
}
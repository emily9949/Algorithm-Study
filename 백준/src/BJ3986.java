import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.List;
import java.util.Stack;

public class BJ3986 {
    public static void main(String[] args) throws IOException {
        // stack 을 사용해서 같은 값끼리 일치하면 pop 시킴

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        Stack<String> stack = new Stack<>();

        int N = Integer.parseInt(br.readLine());

        String str = br.readLine();
        List<String> lists = new LinkedList<>();

        // stack 에 차례대로 하나씩 쌓는데, 제일 위의 값과 새로 들어오려는 값이 같으면 pop 시킴.
        // stack 에 아무것도 남아있지 않으면 짝이 맞으므로, count 증가
        for (String s : str.split("")) {
            lists.add(s);
        }

        for (int i = 0; i < N; i++) {
            stack.push(lists.get(i));

        }

    }
}


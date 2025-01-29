import java.util.Scanner;

public class BJ10871 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();
        int X = sc.nextInt();
        int arr[] = new int[N];

        for (int i = 0; i < arr.length; i++) {
            arr[i] = sc.nextInt();

            if(X > arr[i]){
                // 공백 포함해서 출력하기
                System.out.println(arr[i] + "");
            }
        }

    }
}

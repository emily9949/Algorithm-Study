import java.util.Scanner;

public class BJ11659 {
    // 시간 복잡도 O(NM) 으로 시간 초과
//    public static void main(String[] args) {
//        Scanner sc = new Scanner(System.in);

//        int N = sc.nextInt(); // 개수 N
//        int M = sc.nextInt(); // 횟수 M

//        int[] arr = new int[N];
//
//        for (int i = 0; i < N; i++) {
//            arr[i] = sc.nextInt();
//        }
//
//        for (int i = 0; i < M; i++) {
//            int start = sc.nextInt(); // 구간 합 시작점
//            int end = sc.nextInt();  // 구간 합 끝나는 점
//            int sum = 0;
//
//            // 구간의 합 구하기
//            for (int j = start; j <= end; j++) {
//                sum += arr[j-1];
//            }
//
//            System.out.println(sum);
//        }
//    }

    public static void main(String[] args) {
        // 배열의 각 인덱스까지의 합을 저장하는 부분 합 배열을 생성
        Scanner sc = new Scanner(System.in);
 
        int N = sc.nextInt(); // 개수 N
        int M = sc.nextInt(); // 횟수 M

        int[] arr = new int[N];
    }
}

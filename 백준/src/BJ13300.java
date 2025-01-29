import java.util.Scanner;

public class BJ13300 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int N = sc.nextInt();   // 학생 수
        int K = sc.nextInt();   // 배정할 수 있는 최대 인원수
        int[][] arr = new int[2][6];
        int roomCount = 0;

        for (int i = 0; i < N; i++) {
            // 갯수를 세는 문제이기 때문에 배열에 모든 값을 저장할 필요가 없음. 갯수만 세면 된다.
            // 입력값을 배열의 행, 열에 지정하여 그대로 저장하면 된다.
            // 입력값 만큼 반복문을 돌리고, 두번씩 입력 받는다. 입력값에 따라서 각 배열의 행, 열의 값을 +1 시킨다

            int gender = sc.nextInt();
            int student = sc.nextInt();

            arr[gender][student-1]++;
        }

        // arr 배열을 순회하며 방의 갯수 구하기
        // 학생 수를 최대 인원수로 나눔
        // 1) 학생 수가 0일 때는 방의 갯수가 0
        // 2) 그 외에는 나머지가 있을 때 방의 개수 +1

        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 6; j++) {
               if(arr[i][j] == 0) continue;  // 학생 수가 0일 때는 다음 반복으로 넘어감

               roomCount += arr[i][j] / K;

               if(arr[i][j] % K != 0) roomCount++;
            }
        }
        System.out.print(roomCount);

    }
}


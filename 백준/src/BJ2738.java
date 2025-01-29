import java.util.Scanner;

public class BJ2738 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int N = sc.nextInt();
        int M = sc.nextInt();

        // N, M 크기의 2차원 배열 생성
        int[][] arr1 = new int[N][M];
        int[][] arr2 = new int[N][M];
        int[][] arr3 = new int[N][M];

        for(int i = 0; i < N; i++) {
            for(int j = 0; j < M; j++) {
                arr1[i][j] = sc.nextInt();
            }
        }

        for(int i = 0; i < N; i++) {
            for(int j = 0; j < M; j++) {
                arr2[i][j] = sc.nextInt();
            }
        }

        for(int i = 0; i < N; i++) {
            for(int j = 0; j < M; j++) {
                arr3[i][j] = arr1[i][j] + arr2[i][j];
            }
        }

        for(int i = 0; i < N; i++) {
            for(int j = 0; j < M; j++) {
                System.out.print(arr3[i][j] + " ");
                // j는 인덱스니까 M-1 과 같아야한다
                if(j == M - 1) {
                    System.out.println();
                }
            }
        }


    }
}

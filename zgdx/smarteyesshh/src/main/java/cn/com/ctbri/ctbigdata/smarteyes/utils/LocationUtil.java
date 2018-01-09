package cn.com.ctbri.ctbigdata.smarteyes.utils;

import javafx.geometry.Point2D;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

/**
 * @author zeromem
 * @date 2017/11/27
 */
public class LocationUtil {
    static double startLng = 121.151687;
    static double endLng = 121.747997;
    static double startLat = 30.858478;
    static double endLat = 31.311731;

    public static Point2D randomShh(Random random) {
        double a = random.nextDouble() * (endLng - startLng);
        double b = random.nextDouble() * (endLat - startLat);
        return new Point2D(startLng + a, startLat + b);
    }

    public static Point2D randomNearby(Random random, Point2D point2D) {
        return randomNearby(random, point2D.getX(), point2D.getY());
    }

    public static List<double[]> randomNearbyList(Random random, double[] point2D) {
        LinkedList<double[]> linkedList = new LinkedList<>();
        for (int i = 40; i > 0; i--){
            Point2D point = randomNearby(random, point2D[0], point2D[1]);
            double[] loc = new double[2];
            loc[0] = point.getX();
            loc[1] = point.getY();
            linkedList.add(loc);
        }
        return linkedList;
    }

    public static Point2D randomNearby(Random random, double centerX, double centerY) {
        double a = random.nextDouble() * 0.06;
        double b = random.nextDouble() * 0.06;
        return new Point2D(centerX - 0.03 + a, centerY - 0.03 + b);
    }

    public static double[] randomShhArr(Random random) {
        Point2D point2D = randomShh(random);
        double[] loc = new double[2];
        loc[0] = point2D.getX();
        loc[1] = point2D.getY();
        return loc;
    }

    /**
     * 从start到end的一条随机轨迹
     *
     * @param start
     * @param end
     * @return
     */
    public static List<double[]> trackBetween(Random random, double[] start, double[] end) {
        List<double[]> result = new LinkedList<>();
        int priorDirection = Math.abs(end[0] - start[0]) > Math.abs(end[1] - start[1]) ? 0 : 1;
        int otherDirection = 1 - priorDirection;

        int priorSign = end[priorDirection] - start[priorDirection] > 0 ? 1 : -1;
        int otherSign = end[otherDirection] - start[otherDirection] > 0 ? 1 : -1;

        double[] cur = new double[]{start[0], start[1]};

        while (Math.abs(end[priorDirection] - cur[priorDirection]) > 0.01) {
            double priorAll = Math.abs(end[priorDirection] - cur[priorDirection]);
            double otherAll = Math.abs(end[otherDirection] - cur[otherDirection]);
            double priorDelta = 0.01 + 0.01 * random.nextDouble();
            double otherDelta = (priorDelta / priorAll) * otherAll + 0.002 * (random.nextDouble() * 2 - 1);

            cur[priorDirection] = cur[priorDirection] + priorSign * priorDelta;
            cur[otherDirection] = cur[otherDirection] + otherSign * otherDelta;
            result.add(new double[]{cur[0], cur[1]});
        }
        return result;
    }

    public static void main(String[] args) {
        String id = "17701304228";
        Random random = new Random(Long.valueOf(id));

        double[] point1 = randomShhArr(random);
        double[] point2 = randomShhArr(random);
        System.out.println("new BMap.Point(" + point1[0] + "," + point1[1] + "),");

        List<double[]> track = trackBetween(random, point1, point2);
        for (double[] p : track) {
            System.out.println("new BMap.Point(" + p[0] + "," + p[1] + "),");
        }

        System.out.println("new BMap.Point(" + point2[0] + "," + point2[1] + ")");
    }
}

// You are given an integer array nums, and you can perform the following operation any number of times on nums:

// Swap the positions of two elements nums[i] and nums[j] if gcd(nums[i], nums[j]) > 1 where gcd(nums[i], nums[j]) is the greatest common divisor of nums[i] and nums[j].
// Return true if it is possible to sort nums in non-decreasing order using the above swap method, or false otherwise.

 

// Example 1:

// Input: nums = [7,21,3]
// Output: true
// Explanation: We can sort [7,21,3] by performing the following operations:
// - Swap 7 and 21 because gcd(7,21) = 7. nums = [21,7,3]
// - Swap 21 and 3 because gcd(21,3) = 3. nums = [3,7,21]
// Example 2:

// Input: nums = [5,2,6,2]
// Output: false
// Explanation: It is impossible to sort the array because 5 cannot be swapped with any other element.
// Example 3:

// Input: nums = [10,5,9,3,15]
// Output: true
// We can sort [10,5,9,3,15] by performing the following operations:
// - Swap 10 and 15 because gcd(10,15) = 5. nums = [15,5,9,3,10]
// - Swap 15 and 3 because gcd(15,3) = 3. nums = [3,5,9,15,10]
// - Swap 10 and 15 because gcd(10,15) = 5. nums = [3,5,9,10,15]
 

// Constraints:

// 1 <= nums.length <= 3 * 104
// 2 <= nums[i] <= 105

// Solution:

import java.util.*;
import java.util.stream.IntStream;
import java.io.*;
class Solution {
    public boolean gcdSort(int[] nums) {
        GCDSorter sorter=new GCDSorter();
        return sorter.gcdSort(nums);
    }
}
class GCDSorter{
    IndexGroupFinder indexGroupFinder;
    boolean gcdSort(int nums[]){
        int maximumNumber = Arrays.stream(nums).max().getAsInt();
        indexGroupFinder = new IndexGroupFinder(maximumNumber);
        List<List<Integer>> indexGroups=indexGroupFinder.getIndexGroups(nums);
        sortNumsInGroups(nums, indexGroups);
        return isSorted(nums);
    }
    boolean isSorted(int nums[]){
        for(int i=1;i<nums.length;i++){
            if(nums[i]<nums[i-1]){
                return false;
            }
        }
        return true;
    }
    void sortNumsInGroups(int nums[],List<List<Integer>> indexGroups){
        for(List<Integer> oneGroup:indexGroups){
            sortOnIndexs(nums,oneGroup);
        }
    }
    void sortOnIndexs(int nums[],List<Integer> group){
        List<Integer> sortedElements=new ArrayList<>();
        for(int i=0;i<group.size();i++){
            sortedElements.add(nums[group.get(i)]);
        }
        sortedElements.sort((a,b)->a-b);
        for(int i=0;i<group.size();i++){
            nums[group.get(i)]=sortedElements.get(i);
        }
    }
    
}

class IndexGroupFinder{
    UnionFind unionFind;
    IndexGroupFinder(int maximumNumber){
        unionFind=new UnionFind(maximumNumber+1);
    }
    List<List<Integer>> getIndexGroups(int nums[]){
        int unionArray[]=getUnionArray(nums);
        Map<Integer,List<Integer>> groupToIndexes=new HashMap<>();
        for(int i=0;i<unionArray.length;i++){
            groupToIndexes.putIfAbsent(unionArray[i], new ArrayList<>());
            groupToIndexes.get(unionArray[i]).add(i);
        }
        List<List<Integer>> indexGroups=new ArrayList<>();
        for(List<Integer> indexs:groupToIndexes.values()){
            indexGroups.add(indexs);
        }
        return indexGroups;
    }

    private int[] getUnionArray(int nums[]){
        int numberRepresentation[]=new int[nums.length];
        for(int i=0;i<nums.length;i++){
            List<Integer> primeFactors=FactorFinder.getPrimeFactors(nums[i]);
            //System.out.println(nums[i]+" "+primeFactors);
            unionFind.union(primeFactors);
            numberRepresentation[i]=primeFactors.get(0);
        }
        for(int i=0;i<nums.length;i++){
            numberRepresentation[i]=unionFind.find(numberRepresentation[i]);
        }
        return numberRepresentation;
    }
}

class FactorFinder{
    public static List<Integer> getPrimeFactors(int n) {
        List<Integer> factors = new ArrayList<>();
        if(n%2==0){
            factors.add(2);
            while(n%2==0){
                n/=2;
            }
        }
        for(int i=3;i*i<=n;i+=2){
            if(n%i==0){
                factors.add(i);
                while(n!=0 && n%i==0){
                    n/=i;
                }
            }
        }
        if(n!=1)
            factors.add(n);
        return factors;
    }

}
class UnionFind{
    int parent[];
    int rank[];
    UnionFind(int size){
        this.parent = IntStream.range(0, size).toArray();
        this.rank = new int[size];
        Arrays.fill(rank,1);
    }
    int find(int key){
        while(key!=parent[key]){
            parent[key]=parent[parent[key]];
            key=parent[key];
        }
        return key;
    }
    void union(List<Integer> primeFactors){
        for(Integer primeFactor:primeFactors){
            union(primeFactors.get(0),primeFactor);
        }
    }
    void union(int key1,int key2){
        key1=find(key1);
        key2=find(key2);
        if(key1==key2){
            return;
        }
        if(rank[key1]>rank[key2]){
            makeParent(key1,key2);
        }else{
            makeParent(key2,key1);
        }
    }
    void makeParent(int key1,int key2){
        rank[key1]+=rank[key2];
        parent[key2]=key1;
    }
}
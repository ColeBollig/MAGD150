/*
I know this is a semi-advanced thing being a data structure. It is a linked list is the form of a queue 
so that only 30 clouds are on the screen at a time and so that after 5 seconds a cloud disapears. I am not citing 
anything for this because I know how to do this from experience with java.
*/


class LinkedList{
  Clouds start;
  Clouds current;
  
  LinkedList(){
    current = null;
    start = null;
  }
  
  void appendList(Clouds node){
    if(start == null){
      start = node;
    }
    else{
      current = start;
      while(current.next != null){
        current = current.next;
      }
      current.next = node;
    }
  }
  
  void popList(){
    if(start == null){}
    else{
      if(start.next == null){
        start = null;
      }
      else{
        current = start.next;
        start.next = null;
        start = current;
      }
    }
  }
  
  void display(){
    current = start;
    if(current != null){
      while(current != null){
        current.display();
        current = current.next;
      }
    }
  }
  
  int listSize(){
    int size = 0;
    current = start;
    while(current != null){
      current = current.next;
      size++;
    }
    return size;
  }
}

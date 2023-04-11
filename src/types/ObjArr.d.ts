interface Obj {
  [key: string]: string | number | Date | undefined;
}

type ObjArr = Array<Obj>;

export default ObjArr;

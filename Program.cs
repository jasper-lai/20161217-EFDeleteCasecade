using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EFDeleteCasecade.Models;

namespace EFDeleteCasecade
{
    class Program
    {
        static void Main(string[] args)
        {
            string result = string.Empty;
            string orderNo = string.Empty;

            // 輸入要刪除的訂單編號
            Console.WriteLine("請輸入要刪除的訂單編號: 例如: 201612170002");
            orderNo = Console.ReadLine();

            // 開始進行資料庫異動
            using (var ctx = new EFTestEntities())
            {
                // 將 EF 的明細訊息, 重導到輸出視窗
                // ctx.Database.Log = Console.WriteLine;
                ctx.Database.Log = (log) => Debug.WriteLine(log);
                // 讀取資料, 以確定資料是否存在
                var item = ctx.Orders.Where(x => x.OrderNo == orderNo).Include(y => y.OrderDetails).SingleOrDefault();
                if (null == item)
                {
                    result = "查無此資料";
                }
                else
                {
                    try
                    {
                        ctx.Orders.Remove(item);
                        ctx.SaveChanges();
                        result = "刪除完成";
                    }
                    catch (Exception ex)
                    {
                        result = "刪除失敗" + ex.Message;
                    }
                }

                Console.WriteLine(result);
                Console.ReadLine();
            }
        }
    }
}

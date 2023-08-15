<?php

namespace App\Http\Controllers;

use App\Models\CommentReply;
use App\Models\Comment;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;

class CommentToReplyController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum')->only(['destroy','store']);
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
         return DB::table("comments_to_reply")->join("products","products.id","=","comments_to_reply.product_id")->select("products.image","products.name","comments_to_reply.product_id")->groupBy("products.id")->where("comments_to_reply.reply_to",null)->get()->map(function($item){
            $item->comments = CommentReply::where("product_id",$item->product_id)->where("comment_id",null)->get()->count();
            return $item;
         });
    }

    public function productComments(Request $request)
    {
        return array("comments"=>CommentReply::where("product_id",$request->input("product_id"))->where("reply_to",null)->get()->map(function($item){
            if($this->hasReplies($item->comment_id)){
                $item['replies'] = $this->getReplies($item->comment_id,$item->product_id);
            }
            return $item;
        }),"product"=>Product::find($request->product_id));
    }

    
    public function hasReplies($comment_id)
    {
        if(!$comment_id){
            return false;
        }else{
            return true;
        }
        // return count(CommentReply::where("product_id", $product_id)->where("reply_to",$comment_id)->get()) > 0 ? true : false;
    }

    public function getReplies($comment_id,$product_id)
    {
        return CommentReply::where("product_id", $product_id)->where("reply_to",$comment_id)->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $response = array();
        if($request->reply_to === null){
            $comment_to_reply = CommentReply::find($request->comment_to_reply_id);
            $comment = new Comment();
            $comment->product_id = $comment_to_reply->product_id;
            $comment->commenter = $comment_to_reply->commenter;
            $comment->content = $comment_to_reply->content;
            $comment->created_at = $comment_to_reply->created_at;
            $comment->save();
            $comment_reply = new Comment();
            $comment_reply->product_id = $request->product_id;
            $comment_reply->commenter = json_encode($request->commenter);
            $comment_reply->content = $request->content;
            $comment_reply->reply_to = $comment->id;
            $comment_reply->save();
            CommentReply::find($request->comment_to_reply_id)->delete();
        }else{
            $comment_to_reply = CommentReply::find($request->comment_to_reply_id);
            $comment = new Comment();
            $comment->product_id = $comment_to_reply->product_id;
            $comment->commenter = $comment_to_reply->commenter;
            $comment->content = $comment_to_reply->content;
            $comment->created_at = $comment_to_reply->created_at;
            $comment->reply_to = $request->comment_id;
            $comment->save();
            $response['comment_answered'][] = $comment;
            $comment = new Comment();
            $comment->product_id = $request->product_id;
            $comment->commenter = json_encode($request->commenter);
            $comment->content = $request->content;
            $comment->reply_to = $request->comment_id;
            $comment->save();
            $response['comment_answered'][] = $comment;
            if(CommentReply::where("product_id",$request->product_id)->where("comment_id",null)->where("reply_to",$request->reply_to)->get()->count() > 1){
                $comments_not_answered = array();
                $response_comments_not_answered = array();
                CommentReply::find($request->comment_to_reply_id)->delete();
                CommentReply::where("product_id",$request->product_id)->where("comment_id",null)->where("reply_to",$request->reply_to)->get()->each(function($item) use(&$comments_not_answered){
                    $comments_not_answered[] = $item;
                    $item->delete();
                });
                foreach($response["comment_answered"] as $item){
                    $comment_answered = new CommentReply();
                    $comment_answered->product_id = $item->product_id;
                    $comment_answered->comment_id = $item->id;
                    $comment_answered->commenter = $item->commenter;
                    $comment_answered->content = $item->content;
                    $comment_answered->created_at = $item->created_at;
                    $comment_answered->reply_to = $item->reply_to;
                    $comment_answered->save();
                }
                foreach($comments_not_answered as $item){
                    $comment_not_answered = new CommentReply();
                    $comment_not_answered->product_id = $item->product_id;
                    $comment_not_answered->comment_id = $item->comment_id;
                    $comment_not_answered->commenter = $item->commenter;
                    $comment_not_answered->content = $item->content;
                    $comment_not_answered->created_at = $item->created_at;
                    $comment_not_answered->reply_to = $item->reply_to;
                    $comment_not_answered->save();
                    $response["comments_not_answered"][] = $comment_not_answered;
                }
                
            }else{
                CommentReply::where("comment_id",$request->comment_id)->orWhere("reply_to",$request->comment_id)->get()->each(function($item){
                    $item->delete();
                });
            }
        }
        return response()->json(["message"=>"Ok...","response"=>$response],200);
    }

    /**
     * Display the specified resource.
     */
    public function show(CommentReply $commentReply)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, CommentReply $commentReply)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request,CommentReply $comments_to_reply)
    {
        if (!Gate::forUser($request->user())->allows('manager-action')) {
            return response()->json(["message"=>"Bạn không phải là manager, bạn không có quyền này ?"],403);
        }
        if($request->root_comment_id){
            $Comments_To_Reply = CommentReply::where("reply_to",$request->root_comment_id)->get()->filter(function($item){
                return $item->comment_id === null;
            });
            if(count($Comments_To_Reply) > 1){
                $comments_to_reply->delete();
            }else{
                $comments = CommentReply::where("comment_id",$comments_to_reply->reply_to)->orWhere("reply_to",$comments_to_reply->reply_to)->get()->each(function($item){
                    $item->delete();
                });
            }
        }else{
            $comments_to_reply->delete();
        }
      
        return response()->json(["message"=>"Ok..."]);
    }
}

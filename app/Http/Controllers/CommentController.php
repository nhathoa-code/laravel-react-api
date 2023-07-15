<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\CommentReply;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return Comment::where("product_id",$request->input("product_id"))->where("reply_to",null)->get()->map(function($item){
            if($this->hasReplies($item->id,$item->product_id)){
                $item['replies'] = $this->getReplies($item->id,$item->product_id);
            }
            return $item;
        });
    }


    public function hasReplies($comment_id,$product_id)
    {
        return count(Comment::where("product_id", $product_id)->where("reply_to",$comment_id)->get()) > 0 ? true : false;
    }

    public function getReplies($comment_id,$product_id)
    {
        return Comment::where("product_id", $product_id)->where("reply_to",$comment_id)->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if($request->has("reply_to")){
            if(!CommentReply::where("comment_id",$request->reply_to)->first()){
                    Comment::where("id",$request->reply_to)->orWhere("reply_to",$request->reply_to)->get()->each(function($item){
                    $comment_to_reply = new CommentReply();
                    $comment_to_reply->product_id = $item->product_id;
                    $comment_to_reply->commenter = $item->commenter;
                    $comment_to_reply->content = $item->content;
                    $comment_to_reply->reply_to = $item->reply_to;
                    $comment_to_reply->comment_id = $item->id;
                    $comment_to_reply->save();
                });
            }
            $comment_to_reply = new CommentReply();
            $comment_to_reply->product_id = $request->product_id;
            $comment_to_reply->commenter = json_encode($request->commenter);
            $comment_to_reply->content = $request->content;
            $comment_to_reply->reply_to = $request->reply_to;
            $comment_to_reply->save();
        }else{
            $comment_to_reply = new CommentReply();
            $comment_to_reply->product_id = $request->input("product_id");
            $comment_to_reply->commenter = json_encode($request->input("commenter"));
            $comment_to_reply->content = $request->input("content");
            $comment_to_reply->save();
        }
       
        return response()->json(["message"=>"Ok..."],200);
    }

    /**
     * Display the specified resource.
     */
    public function show(Comment $comment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Comment $comment)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Comment $comment)
    {
        //
    }
}
